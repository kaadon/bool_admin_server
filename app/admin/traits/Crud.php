<?php
// +----------------------------------------------------------------------
// | quickadmin框架 [ quickadmin框架 ]
// +----------------------------------------------------------------------
// | 版权所有 2020~2022 南京新思汇网络科技有限公司
// +----------------------------------------------------------------------
// | 官方网站: https://www.quickadmin.top
// +----------------------------------------------------------------------
// | Author: zs <909883663@qq.com>
// +----------------------------------------------------------------------
namespace app\admin\traits;

use think\exception\ValidateException;
use think\response\Json;
use util\Excel;

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
            $id = input('id');
            $row = $this->model->find($id);
            if (empty($row)) {
                return error('数据不存在');
            }
            $post = $this->request->post();
            try {
                $this->validate && validate($this->validate)->scene('edit')->check($post);
                $result = $row->save($post);
                if (empty($result)) throw new \Exception('保存失败');
            } catch (ValidateException $e) {
                return error("", 201, $e->getError());
            } catch (\Exception $e) {
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
    public function find()
    {
        try {
            //逻辑代码
            $id = input('id');
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
            $id = input('id');
            $status = input('status');
            $row = $this->model->find($id);
            if (empty($row)) {
                return error('数据不存在');
            }
            $msg = $status == 0 ? "禁用" : "启用";
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
        try {
            $id = $this->request->post('id');
            $ids = is_array($id) ? $id : explode(',', $id);
            $row = $this->model->select($ids);
            if ($row->isEmpty()) {
                return error('数据不存在');
            }
            $save = $row->delete();
            return $save ? successes('删除成功！') : error('删除失败');
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
        try {
            $fields = input('fields');
            if (empty($fields)) {
                $fields = "id,name";
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
        } catch (\Exception $e) {
            return error($e->getMessage());
        }
        return success([
            'count' => $count,
            'data' => $list
        ]);

    }

    /**
     * 导出
     */
    public function export(): bool
    {
        try {
            //逻辑代码
            list($limit, $where, $sortArr) = $this->buildTableParames();
            $fields = $this->request->post('fields');
            $fields = json_decode($fields, true);

            $header = [];
            foreach ($fields as $vo) {
                $header[] = [$vo['comment'], $vo['field']];
            }
            $tableName = $this->model->getName();
            $list = $this->model
                ->where($where)
                ->limit(100000)
                ->order($sortArr)
                ->select()
                ->toArray();
            $fileName = "export_" . $tableName . "_" . time();
            return Excel::exportData($list, $header, $fileName, 'xlsx');
        } catch (\Exception $exception) {
            return error($exception->getMessage());
        }
    }
}
