<?php

namespace app\admin\controller\car;

use app\common\controller\AdminBase;
use think\App;

/**
 * CateType控制器
 */
class CateType extends AdminBase
{

    protected $model = null;

    protected $validate = null;

    protected $relationSearch = false;

    public function __construct(App $app)
    {
        parent::__construct($app);

        $this->model = new \app\common\model\CarCateType();

        $this->validate = \app\admin\validate\CarCateType::class;
    }

    
}