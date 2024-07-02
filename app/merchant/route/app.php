<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
use think\facade\Route;
Route::get(':controller/:function' , ':controller/:function')
    ->pattern([
    'controller' => '\w+',
    'function'   => '\w+',
]);
Route::rule(':version/:controller/:function' , ':version.:controller/:function', "get")
    ->pattern([
        'version' => 'v\d+',
        'controller' => '\w+',
        'function'   => '\w+',
    ]);