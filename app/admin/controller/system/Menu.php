<?php

namespace app\admin\controller\system;

use app\common\controller\AdminBase;
use think\App;
use think\facade\Db;
use think\facade\Log;
use think\response\Json;
use util\Token;

/**
 * menu控制器
 */
class Menu extends AdminBase
{

    protected $model = null;

    protected $relationSearch = false;

    public function __construct(App $app)
    {
        parent::__construct($app);
        $this->model = new \app\admin\model\system\SystemMenu();
    }

    /**
     * 添加
     */
    public function add(): Json
    {
        $post = $this->request->post();
        // 启动事务
        Db::startTrans();
        try {
            //逻辑代码
            if ($post['type'] == 1) {
                if ($post['pid'] == 0) {
                    $post['component'] = "Layout";
                } else {
                    $post['component'] = "ParentView";
                }
            }
            //path 如果不是外链 判断是否唯一
            $path = $post['path'] ?? "";
            if ($path && stripos($path, 'http') === false) {
                $count = $this->model->where([
                    'path' => $path,
                    'pid' => $post['pid'] ?? 0
                ])->count();
                if ($count > 0) {
                    return error('路由地址已存在,换个试试！');
                }
            }
            $routes = $post['routes'] ?? '';
            unset($post['routes']);
            $result = $this->model->insertGetId($post);
            if ($result) {
                if ($post['type'] === 2 && isset($routes)) {
                    $routePath = [
                        "index" => "列表",
                        "add" => "添加",
                        "edit" => "编辑",
                        "find" => "查找",
                        "status" => "状态",
                        "delete" => "删除",
                        "selectList" => "列表",
                        "selectPage" => "选择列表",
                        "export" => "导出",
                    ];
                    $menuAll = [];
                    foreach ($routePath as $key => $item) {
                        $menuAll[] = [
                            'type' => 3,
                            'pid' => $result,
                            'title' => $item,
                            'weigh' => 1,
                            'status' => 1,
                            'permission' => "{$routes}/{$key}",
                        ];
                    }
                    $this->model->saveAll($menuAll);
                }
            } else {
                throw new \Exception('添加失败');
            }
            Db::commit();
            return successes('添加成功');
            // 提交事务
        } catch (\Exception $exception) {
            Db::rollback();
            // 回滚事务
            return error('添加失败:' . $exception->getMessage());
        }
    }

    /**
     * 修改
     *
     */
    public function edit(): Json
    {
        $id= input('id');
        $row = $this->model->find($id);
        if (empty($row)) {
            return error('数据不存在');
        }

        $post = $this->request->post();
        if ($post['type'] == 1) {
            if ($post['pid'] == 0) {
                $post['component'] = "Layout";
            } else {
                $post['component'] = "ParentView";
            }
        }
        try {
            //path 如果不是外链 判断是否唯一
            $path = isset($post['path']) ? $post['path'] : "";
            if ($path && stripos($path, 'http') === false) {
                $count = $this->model->where('path', $path)->where('id', '<>', $post['id'])->count();
                if ($count > 0) {
                    return error('路由地址已存在,换个试试！');
                }
            }
            $result = $row->save($post);
            if ($result) {
                return successes('保存成功！');
            }
            return error('保存失败');
        } catch (\Exception $e) {
            Log::error("--------:" . $e);
            return error('保存失败');
        }

        return successes('ok', $row);
    }

    /**
     * 获取所有菜单(无层级)
     */

    public function index(): Json
    {
        $status = $this->request->request('status');
        $menu_type = $this->request->request('menu_type'); //1：目录 2：菜单 3：按钮权限  4：目录+菜单 不传取所有
        $where = [];
        if ($status) {
            $where['status'] = $status;
        }
        if ($menu_type) {
            if ($menu_type == 4) {
                $where[] = ['type', '<', 3];
            }
            if ($menu_type < 4) {
                $where['type'] = $menu_type;
            }
        }
        $count = $this->model->where($where)->count();
        $list = $this->model->where($where)->order('weigh desc,id asc')->select();
        $data = [
            'code' => 200,
            'msg' => 'ok',
            'count' => $count,
            'data' => $list,
        ];
        return json($data);
    }

     /**
     * 获取所有菜单(无层级)
     */

    public function adminIndex(): Json
    {
        $token=$this->request->header('token');
        $status = $this->request->post('status');
        $menu_type = $this->request->post('menu_type'); //1：目录 2：菜单 3：按钮权限  4：目录+菜单 不传取所有
        $where = [];
        if ($status) {
            $where['status'] = $status;
        }
        if ($menu_type) {
            if ($menu_type == 4) {
                $where[] = ['type', '<', 3];
            }
            if ($menu_type < 4) {
                $where['type'] = $menu_type;
            }
        }
        
         /**
         * 管理员对于菜单
         */
        $adminId=Token::userId($token);
        $admin_groups=Db::name("system_group_admin")
                ->where('admin_id',$adminId)
                ->column('group_id');
        $group_menu = Db::name('system_group_menu')
                ->where('group_id', 'in', $admin_groups)
                ->column('menu_id');
        if(!in_array("1",$admin_groups)){
            $where[]=['id','in',$group_menu];
        }

        $count = $this->model->where($where)->count();
        $list = $this->model->where($where)->order('weigh desc,id asc')->select();
        $data = [
            'code' => 200,
            'msg' => 'ok',
            'count' => $count,
            'data' => $list,
        ];
        return json($data);
    }
    /**
     * 数据删除
     */
    public function delete(): Json
    {
        $id= $this->request->post('id');
        $row = $this->model->find($id);
        if ($row->isEmpty()) {
            return error('数据不存在');
        }
        $count = $this->model->where('pid', $id)->count();
        try {
            $save = $this->model->whereIn('id',$this->getDown([$id]))->delete();
        } catch (\Exception $e) {
            return error('删除失败');
        }
        return $save ? successes('删除成功！') : error('删除失败');
    }
    private function getDown(array $ids, bool $merge = true): array
    {
        $arr = $this->model->whereIn('pid', $ids)->column('id');
        if (!empty($arr)) {
            $arr1 = $this->getDown($arr);
            if (!empty($arr1)) $arr = array_merge($arr, $arr1);
        }
        return array_merge($ids, $arr);
    }
    /**
     * 查找
     */
    public function find(): Json
    {
        $id= $this->request->post('id');
        $row = $this->model->find($id);
        unset($row['create_time']);
        unset($row['update_time']);
        if (empty($row)) {
            return error('数据不存在');
        }
        return successes('ok', $row);
    }
}
