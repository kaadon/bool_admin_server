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

namespace commons\models\merchant;

use commons\models\merchant\enum\MerchantAccountCateEnum;
use Kaadon\ThinkBase\BaseClass\BaseModel;
use think\Model;
use think\model\relation\HasOne;

/**
 * @mixin Model
 */
class MerchantProfiles extends BaseModel
{
    /**
     * @return HasOne
     */
    public function account(): HasOne
    {
        return $this->hasOne(MerchantAccounts::class, 'id', 'uid');
    }

    public static function getCates(): array
    {
        $cates = [];
        foreach (MerchantAccountCateEnum::cases() as $case) {
            $cates[] = [
                'label' => $case->name,
                'value' => $case->value,
            ];
        }
        return $cates;
    }
}