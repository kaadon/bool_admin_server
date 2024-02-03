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
namespace app\admin\controller;

use app\BaseController;
use think\response\Json;

/*
 * @Description: index
 * @Date: 2021-05-25 14:57:43
 */
class Index extends BaseController
{

    public function index(): Json
    {
        return successes('quickadmin api is ok!');
    }

}
