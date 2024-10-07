<?php

// +----------------------------------------------------------------------
// | 缓存设置
// +----------------------------------------------------------------------

return [
    // 默认缓存驱动
    'default' => "redis",
    // 缓存连接方式配置
    'stores'  => [
        // redis缓存
        'redis' => [
            // 驱动方式
            'type'       => 'redis',
            // 服务器地址
            'host'       => env('redis.hostname', '127.0.0.1'),
            //  端口号
            'port'       => env('redis.port', '6379'),
            // 如果没有设置密码为空
            'password'   => env('redis.password', null),
            // 缓存前缀¬
            'prefix'     => env('redis.prefix', "bool_admin:"),
            // 缓存有效期 0表示永久缓存
            'expire'     => 0,
            // 缓存标签前缀
            'tag_prefix' => env('redis.tagprefix', "tag:bool_admin:"),
            // 缓存储存库
            'select'     => env('redis.select', 0),
            // 缓存标签前缀
            'timeout'    => 3600,
            // 序列化机制 例如 ['serialize', 'unserialize']
            'serialize'  => ["serialize"],
        ],
    ],
];
