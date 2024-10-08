<?php
// +----------------------------------------------------------------------
// | kaadonadmin框架 [ kaadonadmin框架 ]
// +----------------------------------------------------------------------
// | 版权所有 2020~2024 kaadon.com
// +----------------------------------------------------------------------
// | 官方网站: https://kaadon.kaadon.com
// +----------------------------------------------------------------------
// | Author: kaadon <kaadon.com@gmail.com>
// +----------------------------------------------------------------------
namespace app\admin\traits;

use Kaadon\ThinkBase\utils\File;
use resources\enum\StatusEnum;
use think\exception\ValidateException;
use think\facade\Cache;
use think\facade\Db;
use think\response\Json;
use Kaadon\Office\Excel;

/**
 * crud 复用类
 * @Autor: zs
 * @Date: 2021-05-25 17:34:23
 * @LastEditors: zs
 * @LastEditTime: 2021-05-25 17:35:59
 */
trait Crud
{
    /**
     * 列表
     */
    public function index(): Json
    {
        try {
            //逻辑代码
            list($limit, $where, $sortArr) = $this->buildTableParames();
            $list = $this->model
                ->where($where)
                ->order($sortArr)
                ->paginate($limit);
            return paginate($list);
        } catch (\Exception $exception) {
            return error($exception->getMessage());
        }
    }

    /**
     * 添加
     */
    public function add(): Json
    {
        $post = $this->request->post();
        try {
            $this->validate && validate($this->validate)->check($post);
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
     * 修改
     *
     */
    public function edit(): Json
    {
        try {
            //逻辑代码
            $id = $this->request->param('id');
            $row = $this->model->find($id);
            if (empty($row)) {
                return error('数据不存在');
            }
            $post = $this->request->post();
            // 启动事务
            Db::startTrans();
            try {
                //逻辑代码
                $this->validate && validate($this->validate)->scene('edit')->check($post);
                $relationUpdates = [];
                foreach ($post as $key => $item) {
                    if (str_contains($key, '.')) {
                        unset($post[$key]);
                        $keyArr = explode(".", $key);
                        if (isset($keyArr[0])) {
                            if (isset($relationUpdates[$keyArr[0]])) {
                                $relationUpdates[$keyArr[0]] = [$keyArr[1] => $item];
                            } else {
                                $relationUpdates[$keyArr[0]][$keyArr[1]] = $item;
                            }
                        }
                    }
                }
                if (!empty($relationUpdates)) {
                    foreach ($relationUpdates as $key => $relationUpdate) {
                        if (!empty($row->$key)) ($row->$key)->save($relationUpdate);
                    }
                }
                $result = $post ? $row->save($post) : true;
                if (empty($result)) throw new \Exception('保存失败');
                // 提交事务
                Db::commit();
            } catch (\Exception $exception) {
                // 回滚事务
                Db::rollback();
                return error('保存失败');
            }
            return success($row);
        } catch (\Exception $exception) {
            return error($exception->getMessage());
        }
    }

    /**
     * 查找
     */
    public function find(): Json
    {
        try {
            //逻辑代码
            $id = $this->request->param('id');
            $row = $this->model->find($id);
            if (empty($row)) {
                return error('数据不存在');
            }
            return success($row);
        } catch (\Exception $exception) {
            return error($exception->getMessage());
        }
    }

    /**
     * 状态启用、禁用
     */
    public function status(): Json
    {
        try {
            $id = $this->request->param('id');
            $status = $this->request->param('status') ? StatusEnum::tryFrom($this->request->param('status')) : null;
            if (empty($status)) return error('状态错误');
            $row = $this->model->find($id);
            if (empty($row)) return error('数据不存在');
            $row->status = $status->value;
            $row->save();
            return successes("修改状态成功:{$status->label()}");
        } catch (\Exception $e) {
            return error("修改状态失败");
        }
    }

    /**
     * 数据删除
     */
    public function delete(): Json
    {
        try {
            $id = $this->request->post('id');
            $ids = is_array($id) ? $id : explode(',', $id);
            $row = $this->model->select($ids);
            if ($row->isEmpty()) {
                return error('数据不存在');
            }
            return $row->delete() ? successes('删除成功！') : error('删除失败');
        } catch (\Exception $e) {
            return error('删除失败');
        }
    }

    /**
     * 下拉选择列表
     *
     */
    public function selectList(): Json
    {

        try {
            $field = $this->request->param('field');
            $field = empty($field) ? "name" : "$field as label";
            $fields = $this->request->param('fields');
            if (empty($fields)) {
                $fields = "id,{$field}";
            }
            $data = $this->model
                ->field($fields)
                ->limit(100)
                ->select();
            return successes("success", $data);
        } catch (\Exception $e) {
            return error($e->getMessage());
        }
    }

    /**
     * 下拉列表分页
     */
    public function selectPage(): Json
    {
        try {
            list($limit, $where, $sortArr) = $this->buildTableParames();
            $page = $this->request->post('page', 1);
            $limit = $this->request->post('limit', 15);
            $show_id = $this->request->post('show_id', 'id'); //前端显示的value
            $query_field = $this->request->post('query_field', 'name'); //查询的参数名称
            $show_field = $this->request->post('show_field', 'name'); //前端显示的label
            $keyword = $this->request->post('keyword', ''); //查询的参数值
            $query_value = $this->request->post('query_value', ''); //编辑查询检索的值
            if ($query_value) {
                $where[] = [$show_id, '=', $query_value];
            }
            if ($keyword) {
                $where[] = [$query_field, 'LIKE', "%{$keyword}%"];
            }
            $fields = $show_id . ',' . $show_field;
            $count = $this->model
                ->where($where)
                ->count();
            $datalist = $this->model
                ->field($fields)
                ->where($where)
                ->page($page, $limit)
                ->select();
            $list = [];
            foreach ($datalist as $index => $item) {
                $result = [
                    $show_id => isset($item[$show_id]) ? $item[$show_id] : '',
                    $show_field => isset($item[$show_field]) ? $item[$show_field] : '',
                ];
                $list[] = $result;
            }
            return success([
                'count' => $count,
                'data' => $list
            ]);
        } catch (\Exception $e) {
            return error($e->getMessage());
        }
    }

    /**
     * 导出
     */
    public function export(): Json|bool
    {
        try {
            //逻辑代码
            list($where, $sortArr) = $this->buildTableParames();
            $fields = $this->request->post('fields');
            $relation = [];
            $fields = json_decode($fields, true);
            foreach ($fields as $field) {
                if (isset($field['field']) && str_contains($field['field'], '.')) {
                    $arr = explode('.', $field['field']);
                    isset($relation[$arr[0]]) ? $relation[$arr[0]][] = $arr[1] : $relation[$arr[0]] = [$arr[1]];
                }
            }
            $header = [];
            foreach ($fields as $vo) {
                $header[] = [$vo['comment'], $vo['field']];
            }
            $list = $this->model;
            if (count($relation) > 0) $list = $list->withJoin($relation);
            $list = $list->where($where)
                ->limit(100000)
                ->order($sortArr)
                ->select()
                ->toArray();
            File::dirMkdir(runtime_path('file'));
            $fileName = "export_" . $this->model->getName() . "_" . time();
            $path =runtime_path('file') . $fileName . '.xlsx';
            Excel::exportData($list, $header, $fileName, 'xlsx',$path);
            Cache::set(md5($path), ['path' => $path, 'filename' => $fileName], 3600);
            return success(['path' => md5($path)]);
        } catch (\Exception $exception) {
            return error($exception->getMessage(), 201, [
                'file' => $exception->getFile(),
                'line' => $exception->getLine(),
                'trace' => $exception->getTrace()
            ]);
        }
    }
}
