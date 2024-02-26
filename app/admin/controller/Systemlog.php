<?php
/*
 * @Autor: zs
 * @Date: 2021-05-26 09:12:32
 * @LastEditors: zs
 * @LastEditTime: 2021-05-26 15:43:45
 */
// +----------------------------------------------------------------------
// | kaadonadmin框架 [ kaadonadmin框架 ]
// +----------------------------------------------------------------------
// | 版权所有 2020~2024 kaadon.com
// +----------------------------------------------------------------------
// | 官方网站: https://kaadon.kaadon.com
// +----------------------------------------------------------------------
// | Author: kaadon <kaadon.com@gmail.com>
// +----------------------------------------------------------------------
namespace app\admin\controller;

use app\common\controller\AdminBase;
use think\App;
use think\response\Json;

/*
 * @Description: Do not edit
 * @Date: 2021-05-25 14:57:43
 */
class Systemlog extends AdminBase
{
    public function __construct(App $app)
    {
        parent::__construct($app);
        $this->model = new \app\admin\model\system\SystemLog();
    }
    /**
     * 添加
     */
    public function add(): Json
    {
        $post = $this->request->post();
        try {
            $result = $this->model->save($post);
            if ($result) {
                return successes('添加成功！');
            }

            return error('添加失败');
        } catch (\Exception $e) {
            return error('添加失败:' . $e->getMessage());
        }

    }

    /**
     * 列表
     */
    public function index(): Json
    {
       
        list($limit, $where, $sortArr) = $this->buildTableParames();

        $list = $this->model
            ->where($where)
            ->order($sortArr)
            ->paginate($limit);

        $data = [
            'code' => 200,
            'msg' => '',
            'count' => $list->total(),
            'data' => $list->items(),
        ];
        return json($data);
    }

}
