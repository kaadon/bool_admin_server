<?php
// +----------------------------------------------------------------------
// | quickadmin框架 [ quickadmin框架 ]
// +----------------------------------------------------------------------
// | 版权所有 2020~2022 南京新思汇网络科技有限公司
// +----------------------------------------------------------------------
// | 官方网站: https://www.quickadmin.top
// +----------------------------------------------------------------------
// | Author: zs <909883663@qq.com>
// +----------------------------------------------------------------------
namespace app\admin\controller;

use app\BaseController;

/*
 * @Description: index
 * @Date: 2021-05-25 14:57:43
 */
class Index extends BaseController
{

    public function index()
    {
        return success('quickadmin api is ok!');
    }

}
