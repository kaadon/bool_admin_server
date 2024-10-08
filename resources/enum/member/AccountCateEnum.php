<?php

namespace resources\enum\member;


/**
 *账号类型 手机号/邮箱
 * Class AccountCateEnum
 * @package resources\enum
 */
enum AccountCateEnum:int
{
    case MOBILE = 1;
    case EMAIL = 2;

    /**
     * @return string
     */
    public function label(): string
    {
        return match ($this) {
            self::MOBILE => '手机号',
            self::EMAIL => '邮箱',
        };
    }

    /**
     * @return string
     */
    public function field(): string
    {
        return match ($this) {
            self::MOBILE => 'mobile',
            self::EMAIL => 'email',
        };
    }

}
