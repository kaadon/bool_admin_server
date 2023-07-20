<?php
declare (strict_types = 1);

namespace app\home\controller;

use think\response\Json;

class Index
{
    public function index(): Json
    {
        return successes("这是 boolAdmin 站点");
    }
}
