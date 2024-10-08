<?php
declare (strict_types = 1);

namespace app\member\controller;

use app\member\MemberBase;
use think\response\Json;

class Index extends MemberBase
{
    public function index(): Json
    {
        return success('Hello, member!');
    }
}
