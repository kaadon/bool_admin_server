<?php
/**
 *   +----------------------------------------------------------------------
 *   | PROJECT:   [ bool_admin_server ]
 *   +----------------------------------------------------------------------
 *   | 官方网站:   [ https://developer.kaadon.com ]
 *   +----------------------------------------------------------------------
 *   | Author:    [ kaadon <kaadon.com@gmail.com> codemiracle]
 *   +----------------------------------------------------------------------
 *   | Tool:      [ PhpStorm ]
 *   +----------------------------------------------------------------------
 *   | Date:      [ 2024/2/27 ]
 *   +----------------------------------------------------------------------
 *   | 版权所有    [ 2020~2024 kaadon.com ]
 *   +----------------------------------------------------------------------
 **/

namespace commons\models\member;

use commons\models\member\enum\MemberAccountCateEnum;
use commons\models\member\enum\MemberAccountLevelEnum;
use Kaadon\ThinkBase\BaseClass\BaseModel;
use think\Model;
use think\model\relation\HasOne;

/**
 * @mixin Model
 */
class MemberProfiles extends BaseModel
{
    /**
     * @return HasOne
     */
    public function account(): HasOne
    {
        return $this->hasOne(MemberAccounts::class, 'id', 'mid');
    }

    public static function getCates(): array
    {
        $cates = [];
        foreach (MemberAccountCateEnum::cases() as $case) {
            $cates[] = [
                'label' => $case->name,
                'value' => $case->value,
            ];
        }
        return $cates;
    }

    public static function getLevels(): array
    {
        $levels = [];
        foreach (MemberAccountLevelEnum::cases() as $case) {
            $levels[] = [
                'label' => $case->name,
                'value' => $case->value,
            ];
        }
        return $levels;
    }




}