<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: yunwuxin <448901948@qq.com>
// +----------------------------------------------------------------------

return [
    'default'     => 'redis',
    'connections' => [
        'sync'     => [
            'type' => 'sync',
        ],
        'database' => [
            'type'       => 'database',
            'queue'      => 'default',
            'table'      => 'jobs',
            'connection' => null,
        ],
        'redis'    => [
            'type'       => 'redis',
            // 默认队列
            'queue'      => 'default',
            // 服务器地址
            'host'       => env('redis.hostname', '127.0.0.1'),
            //  端口号
            'port'       => env('redis.port', '6379'),
            //  密码
            'password'   => env('redis.password', null),//如果没有设置密码为空
            // 缓存前缀
            'prefix'     => env('redis.prefix', "bool_admin:"),
            // 缓存标签前缀
            'tag_prefix' => env('redis.tagprefix', "tag:bool_admin:"),
            // 缓存储存库
            'select'     => 16,
            //超时
            'timeout'    => 10,
            // 持久化
            'persistent' => true,
        ],
    ],
    'failed'      => [
        'type'  => 'none',
        'table' => 'failed_jobs',
    ],
];
