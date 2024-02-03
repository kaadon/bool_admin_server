<?php

namespace app\admin\controller\system;

use app\admin\model\system\SystemGroupAdmin;
use app\admin\model\system\SystemGroupMenu;
use app\admin\service\MenuService;
use app\common\controller\AdminBase;
use think\App;
use think\exception\ValidateException;
use think\facade\Log;
use think\response\Json;
use util\Token;

/**
 * 角色组控制器
 */
class Role extends AdminBase
{

    protected $model = null;
    protected $validate = null;
    protected bool $relationSearch = false;

    public function __construct(App $app)
    {
        parent::__construct($app);

        $this->model = new \app\admin\model\system\SystemGroup();

    }

    /**
     * 列表
     */
    public function index(): Json
    {
        $token = $this->request->header("token");

        list($limit, $where, $sortArr) = $this->buildTableParames();
        $is_superadmin = Token::is_superadmin($token);
        if (!$is_superadmin) {
            $adminId = Token::userId($token);
            $where[] = ['admin_id', '=', $adminId];
        }
        $list = $this->model
            ->where($where)
            ->order($sortArr)
            ->paginate($limit);
        return paginate($list);
    }

    /**
     * 授权数据
     */

    public function authData(): Json
    {
        $id = $this->request->post('id');
        if (!$id) {
            return error('id不能为空');
        }
        $token = $this->request->header('token');
        $adminId = Token::userId($token);
        $menuService = new MenuService($adminId);
        $menuList = $menuService->getAuthMenuData($id);
        return successes("success", $menuList);
    }

    /**
     * 授权角色组数据
     */
    public function authGroup(): Json
    {
        $id = $this->request->post('id');
        $menu_ids = $this->request->post('menu_ids');
        if (!$id || !$menu_ids) {
            return error('参数不能为空');
        }
        $group = [];
        //$menuArr = explode(',', $menu_ids);
        $menuArr = $menu_ids;
        foreach ($menuArr as $k => $v) {
            $row['group_id'] = $id;
            $row['menu_id'] = $v;
            $group[] = $row;
        }
        try {
            $group_menu_model = new SystemGroupMenu();
            $group_menu_model->where('group_id', $id)->delete();
            $group_menu_model->saveAll($group);
        } catch (\Exception $e) {
            Log::error("--group authGroup error:---" . $e);
            return error('error');
        }
        return successes('ok');
    }

    /**
     * 添加
     */
    public function add(): Json
    {
        $token = $this->request->header("token");
        $adminId = Token::userId($token);

        $post = $this->request->post();
        try {
            $this->validate && validate($this->validate)->check($post);
            $post['admin_id'] = $adminId;
            $result = $this->model->save($post);
            if ($result) {
                return successes('添加成功！');
            }
            return error('添加失败');
        } catch (ValidateException $e) {

            return error($e->getError());
        } catch (\Exception $e) {
            return error('添加失败:' . $e->getMessage());
        }

    }

    /**
     * 状态启用、禁用
     */
    public function status(): Json
    {
        $id = $this->request->post('id');
        $status = $this->request->post('status');
        if ($id == 1) {
            return error('超级管理员不可以修改！');
        }
        $row = $this->model->find($id);
        if (empty($row)) {
            return error('数据不存在');
        }
        $msg = $status == 0 ? "禁用" : "启用";
        try {
            $row->status = $status;
            $row->save();
            return successes("状态{$msg}成功！");
        } catch (\Exception $e) {
            return error("状态{$msg}失败");
        }
    }

    /**
     * 数据删除
     */
    public function delete(): Json
    {
        $id = $this->request->post('id');
        $ids = is_array($id) ? $id : explode(',', $id);
        $row = $this->model->where("id", "in", $ids)->select();
        if ($row->isEmpty()) {
            return error('数据不存在');
        }
        $save = 1;
        if (in_array("1", $ids) || in_array(1, $ids)) {
            return error('超级管理员不可以删除!');
        }
        try {
            $count = SystemGroupAdmin::where('group_id', 'in', $ids)->count();
            if ($count > 0) {
                return error('当前角色组下有管理员不能删除!');
            }
            $save = $row->delete();
        } catch (\Exception $e) {
            return error('删除失败');
        }
        return $save ? successes('删除成功！') : error('删除失败');

    }

    /**
     * 下拉选择列表
     *
     */
    public function selectList(): Json
    {
        $token = $this->request->header("token");
        $is_superadmin = Token::is_superadmin($token);
        try {
            $where = [];
            if (!$is_superadmin) {
                $adminId = Token::userId($token);
                $where['admin_id'] = $adminId;
            }

            $fields = input('fields');
            if (empty($fields)) {
                $fields = "id,name";
            }
            $data = $this->model
                ->field($fields)
                ->where($where)
                ->where('status', 1)
                ->limit(100)
                ->select();
            return successes("success", $data);
        } catch (\Exception $e) {
            Log::error("--------:" . $e);
            return error('获取数据失败');
        }

    }

}
