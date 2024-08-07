<?php
// 全局中间件定义文件

use resources\middleware\AllowCrossDomain;
use resources\middleware\VisitLog;

return [
    // 全局请求缓存
    // \think\middleware\CheckRequestCache::class,
    // 多语言加载
    // \think\middleware\LoadLangPack::class,
    // Session初始化
    // \think\middleware\SessionInit::class
    AllowCrossDomain::class,
    VisitLog::class,
];
