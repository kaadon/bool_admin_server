<?php

namespace resources\enum;

use resources\model\service\ServiceUuids;

/**
 * 账号类型 代理商/会员
 * Class AccountTypeEnum
 * @package resources\enum
 */
enum AccountTypeEnum:int
{
    case MERCHANT = 1;
    case MEMBER = 2;

    /**
     * @return string
     */
    public function label(): string{
        return match ($this) {
            self::MERCHANT => '代理商',
            self::MEMBER => '会员',
        };
    }

    /**
     * @return string
     */
    public function uuidField(): string
    {
        return match ($this) {
            self::MERCHANT => 'mc',
            self::MEMBER => 'mb',
        };
    }

    /**
     * @return string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */

    public function getUuid(): string{
        return ServiceUuids::getUuid($this, 1);
    }
}
