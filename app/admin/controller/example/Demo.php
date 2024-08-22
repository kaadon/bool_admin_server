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
namespace app\admin\controller\example;

use app\admin\AdminBase;
use app\admin\model\example\ExampleDemo;
use think\App;
use think\exception\ValidateException;
use think\facade\Log;
use think\response\Json;
use Kaadon\Office\Excel;

/*
 * @Description: Do not edit
 * @Date: 2021-05-25 14:57:43
 */

class Demo extends AdminBase
{
    public function __construct(App $app)
    {
        parent::__construct($app);
        $this->model = new ExampleDemo();
        $this->validate = \app\admin\validate\Demo::class;
    }
    /**
     * 列表
     */
    public function index(): Json
    {
        list($limit, $where, $sortArr) = $this->buildTableParames();

        $list = $this->model
            ->withJoin('category', 'LEFT')
            ->where($where)
            ->order($sortArr)
            ->paginate($limit);
        return paginate($list,["config" => get_config_group("site")]);
    }
    /**
     * 添加
     */
    public function add(): Json
    {
        $post = $this->request->post();
        try {
            $this->validate && validate($this->validate)->check($post);
            if ($post['flag'] && is_array($post['flag'])) {
                $post['flag'] = implode(',', $post['flag']);
            }
            if ($post['actdata'] && is_array($post['actdata'])) {
                $post['actdata'] = implode(',', $post['actdata']);
            }
            if ($post['city'] && is_array($post['city'])) {
                $post['city'] = implode(',', $post['city']);
            }
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
     * 查找
     */
    public function find(): Json
    {
        $id = $this->request->post('id');
        $row = $this->model->find($id);
        if ($row['flag']) {
            $arr = explode(",", $row['flag']);
            foreach ($arr as $k => $v) {
                $arr[$k] = $v * 1;
            }
            $row['flag'] = $arr;
        } else {
            $row['flag'] = [];
        }
        if ($row['actdata']) {

            $arr = explode(",", $row['actdata']);
            foreach ($arr as $k => $v) {
                $arr[$k] = $v * 1;
            }
            $row['actdata'] = $arr;
        } else {
            $row['actdata'] = [];
        }
        if ($row['city']) {
            $row['city'] = explode(',', $row['city']);
        } else {
            $row['city'] = [];
        }
        if (empty($row)) {
            return error('数据不存在');
        }
        return successes('ok', $row);
    }
    /**
     * 修改
     *
     */
    public function edit(): Json
    {
        $id = input('id');
        $row = $this->model->find($id);
        if (empty($row)) {
            return error('数据不存在');
        }

        if ($this->request->isPost()) {
            $post = $this->request->post();
            try {
                $this->validate && validate($this->validate)->check($post);
                if ($post['flag'] && is_array($post['flag'])) {
                    $post['flag'] = implode(',', $post['flag']);
                }
                if ($post['actdata'] && is_array($post['actdata'])) {
                    $post['actdata'] = implode(',', $post['actdata']);
                }
                if ($post['city'] && is_array($post['city'])) {
                    $post['city'] = implode(',', $post['city']);
                }
                $result = $row->save($post);
                if ($result) {
                    return successes('保存成功！');
                }
                return error('保存失败');
            } catch (ValidateException $e) {

                return error($e->getError());
            } catch (\Exception $e) {
                Log::error("--------:" . $e);
                return error('保存失败');
            }
        }
        if ($row['flag']) {
            $arr = explode(",", $row['flag']);
            foreach ($arr as $k => $v) {
                $arr[$k] = $v * 1;
            }
            $row['flag'] = $arr;
        } else {
            $row['flag'] = [];
        }
        if ($row['actdata']) {

            $arr = explode(",", $row['actdata']);
            foreach ($arr as $k => $v) {
                $arr[$k] = $v * 1;
            }
            $row['actdata'] = $arr;
        } else {
            $row['actdata'] = [];
        }
        if ($row['city']) {
            $row['city'] = explode(',', $row['city']);
        } else {
            $row['city'] = [];
        }
        if (empty($row)) {
            return error('数据不存在');
        }
        return successes('ok', $row);
    }
    /**
     * 导出
     */
    public function export(): Json|bool
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
                ->withJoin('category', 'LEFT')
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
