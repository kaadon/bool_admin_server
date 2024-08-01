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
 *   | Date:      [ 2024/2/28 ]
 *   +----------------------------------------------------------------------
 *   | 版权所有    [ 2020~2024 kaadon.com ]
 *   +----------------------------------------------------------------------
 **/

namespace resources\enum\member;

use resources\model\system\SystemMemberLevels;

enum MemberAccountLevelEnum: int
{
    case ORDINARY_MEMBER = 0; //普通会员
    case ONE_MEMBERSHIP = 1; //一级会员
    case TWO_MEMBERSHIP = 2; // 二级会员
    case THREE_MEMBERSHIP = 3; // 三级会员
    case FOUR_MEMBERSHIP = 4; // 四级会员
    case FIVE_MEMBERSHIP = 5; // 五级会员
    case SIX_MEMBERSHIP = 6; // 六级会员
    case SEVEN_MEMBERSHIP = 7; // 七级会员
    case EIGHT_MEMBERSHIP = 8; // 八级会员
    case NINE_MEMBERSHIP = 9; // 九级会员
    case TEN_MEMBERSHIP = 10; // 十级会员

    public function label(): string
    {
        return match ($this) {
            self::ORDINARY_MEMBER => '普通会员',
            self::ONE_MEMBERSHIP => '一级会员',
            self::TWO_MEMBERSHIP => '二级会员',
            self::THREE_MEMBERSHIP => '三级会员',
            self::FOUR_MEMBERSHIP => '四级会员',
            self::FIVE_MEMBERSHIP => '五级会员',
            self::SIX_MEMBERSHIP => '六级会员',
            self::SEVEN_MEMBERSHIP => '七级会员',
            self::EIGHT_MEMBERSHIP => '八级会员',
            self::NINE_MEMBERSHIP => '九级会员',
            self::TEN_MEMBERSHIP => '十级会员',
        };
    }

    /**
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     */
    public function getLevelOptions(): ?array
    {
        $option = (new SystemMemberLevels())->where('cate', $this->value)
            ->withoutField('id,cate,delete_time,update_time,create_time')
            ->find();
        if (empty($option)) return null;
        return array_merge($option->toArray(), match ($this) {
            self::ORDINARY_MEMBER, self::ONE_MEMBERSHIP => [],
            self::TWO_MEMBERSHIP => [
                'one_levels' => [self::ONE_MEMBERSHIP->value => 3],
            ],
            self::THREE_MEMBERSHIP => [
                'one_levels' => [self::TWO_MEMBERSHIP->value => 3],
            ],
            self::FOUR_MEMBERSHIP => [
                'one_levels' => [self::THREE_MEMBERSHIP->value => 3],
            ],
            self::FIVE_MEMBERSHIP => [
                'one_levels' => [self::FOUR_MEMBERSHIP->value => 3],
            ],
            self::SIX_MEMBERSHIP => [
                'one_levels' => [self::FIVE_MEMBERSHIP->value => 3],
            ],
            self::SEVEN_MEMBERSHIP => [
                'one_levels' => [self::SIX_MEMBERSHIP->value => 3],
            ],
            self::EIGHT_MEMBERSHIP => [
                'one_levels' => [self::SEVEN_MEMBERSHIP->value => 3],
            ],
            self::NINE_MEMBERSHIP => [
                'one_levels' => [self::EIGHT_MEMBERSHIP->value => 3],
            ],
            self::TEN_MEMBERSHIP => [
                'one_levels' => [self::NINE_MEMBERSHIP->value => 3]
            ],
        });
    }
}

