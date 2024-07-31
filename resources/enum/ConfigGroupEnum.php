<?php

namespace resources\enum;

/**
 * 配置分组枚举
 * Class ConfigGroupEnum
 * @package resources\enum
 */
enum ConfigGroupEnum: string
{
    case SITE = 'site';
    case UPLOAD = 'upload';
    case BLOCK = 'block';

    public function getLabel(): string
    {
        return match ($this) {
            self::SITE => '基础配置',
            self::UPLOAD => '上传配置',
            self::BLOCK => '区块配置',
        };
    }


}