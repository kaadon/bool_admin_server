<?php

namespace app\admin\controller\example;

use app\common\controller\AdminBase;
use think\App;

/**
 * Category控制器
 */
class Category extends AdminBase
{

    public function __construct(App $app)
    {
        parent::__construct($app);

        $this->model = new \app\admin\model\ExampleCategory();

    }

}
