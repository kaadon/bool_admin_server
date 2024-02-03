<?php

namespace app\admin\controller\system;

use app\common\controller\AdminBase;
use think\App;
use think\response\Json;

/**
 * 日志控制器
 */
class Log extends AdminBase
{

    protected $model = null;

    protected bool $relationSearch = true;

    public function __construct(App $app)
    {
        parent::__construct($app);

        $this->model = new \app\admin\model\system\SystemLog();

    }

    /**
     * 列表
     */
    public function index(): Json
    {
        list($limit, $where, $sortArr) = $this->buildTableParames();
        $sortArr[]="id desc";
        $list = $this->model
            ->with(['admin'])
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
