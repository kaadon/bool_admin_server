<?php
/**
 *   +----------------------------------------------------------------------
 *   | PROJECT:   [ machine01_server ]
 *   +----------------------------------------------------------------------
 *   | 官方网站:   [ https://developer.kaadon.com ]
 *   +----------------------------------------------------------------------
 *   | Author:    [ kaadon.com <kaadon.com@gmail.com>]
 *   +----------------------------------------------------------------------
 *   | Tool:      [ PhpStorm ]
 *   +----------------------------------------------------------------------
 *   | Date:      [ 2024/7/4 ]
 *   +----------------------------------------------------------------------
 *   | 版权所有    [ 2020~2024 kaadon.com ]
 *   +----------------------------------------------------------------------
 **/

namespace resources\enum;

enum ArticleCateEnum: int
{
    case NEWS = 1; // 新闻
    case ACTIVITY = 2; // 活动
    case PLATFORM_RULES = 3; // 平台规则


    public function getName(): string
    {
        return match ($this) {
            self::NEWS => '新闻',
            self::ACTIVITY => '活动',
            self::PLATFORM_RULES => '平台规则',
        };
    }

    public function getLimit(): int
    {
        return match ($this) {
            self::PLATFORM_RULES, self::NEWS, self::ACTIVITY => 0
        };
    }

    public function getOptions(): array
    {
        $field = ['cate','title'];
        return array_merge($field, ['introduction', 'logo', 'content']);
    }
}
