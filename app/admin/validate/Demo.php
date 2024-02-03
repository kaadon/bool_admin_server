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
namespace app\admin\validate;

use think\Validate;

/*
 * @Autor: zs
 * @Date: 2021-05-25 16:21:16
 * @LastEditors: zs
 * @LastEditTime: 2021-05-25 16:21:18
 */
class Demo extends Validate
{
    protected $rule=[
        'title' =>'require',
        'weigh'   => 'number|between:1,120',
    ];
  
}
