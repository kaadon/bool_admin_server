<?php
// +----------------------------------------------------------------------
// | 路由设置
// +----------------------------------------------------------------------

return [

    // 路由中间件
    'middleware' => [
        // 检测用户是否登录
        \app\admin\middleware\CheckLogin::class,
        \app\admin\middleware\CheckAuth::class,
    ],
];
