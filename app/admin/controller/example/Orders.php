<?php

namespace app\admin\controller\example;

use app\common\controller\AdminBase;
use think\App;
use think\facade\Log;
use think\response\Json;

/**
 * Orders控制器
 */
class Orders extends AdminBase
{
    public function __construct(App $app)
    {
        parent::__construct($app);

        $this->model = new \app\common\model\ExampleOrders();

        $this->validate = \app\admin\validate\Orders::class;
    }

    public function op(): Json
    {
        $post = $this->request->post();
        $id = $post['id'];
        $row = $this->model->find($id);
        if (empty($row)) {
            return error('数据不存在');
        }
        try {
            $result = $row->save($post);
            if ($result) {
                return successes('更新成功！');
            }
            return error('更新失败');
        } catch (\Exception $e) {
            Log::error("--------:" . $e);
            return error('更新失败');
        }

        return successes('ok', $row);
    }

}
