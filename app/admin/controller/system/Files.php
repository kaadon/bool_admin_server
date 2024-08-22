<?php

namespace app\admin\controller\system;

use app\admin\AdminBase;
use think\App;

/**
 * 文件控制器
 */
class Files extends AdminBase
{
    public function __construct(App $app)
    {
        parent::__construct($app);
        $this->model = new \resources\model\system\SystemFiles();
    }


}
