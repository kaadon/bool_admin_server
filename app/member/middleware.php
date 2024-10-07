<?php
// 这是系统自动生成的middleware定义文件
use app\member\middleware\MemberCheckAuth;
use app\member\middleware\MemberV1BeforeInit;

return [
    MemberCheckAuth::class,
    MemberV1BeforeInit::class
];
