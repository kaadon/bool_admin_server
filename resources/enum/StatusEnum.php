<?php
/**
 *   +----------------------------------------------------------------------
 *   | PROJECT:   [ bool_admin_server ]
 *   +----------------------------------------------------------------------
 *   | 官方网站:   [ https://developer.kaadon.com ]
 *   +----------------------------------------------------------------------
 *   | Author:    [ kaadon.com <kaadon.com@gmail.com>]
 *   +----------------------------------------------------------------------
 *   | Tool:      [ PhpStorm ]
 *   +----------------------------------------------------------------------
 *   | Date:      [ 2024/7/25 ]
 *   +----------------------------------------------------------------------
 *   | 版权所有    [ 2020~2024 kaadon.com ]
 *   +----------------------------------------------------------------------
 **/

namespace resources\enum;

/**
 * 状态类型 枚举
 * Class StatusEnum
 * @package resources\enum
 */
enum StatusEnum:int
{
    case NORMAL = 1;
    case DISABLE = -1;
    case WAIT = 2;

    /**
     * @return string
     */
    public function label(): string
    {
        return match ($this) {
            self::NORMAL => '正常',
            self::DISABLE => '禁用',
            self::WAIT => '待审核',
        };
    }

}
