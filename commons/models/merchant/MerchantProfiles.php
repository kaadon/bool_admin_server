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

use Kaadon\ThinkBase\BaseClass\BaseModel;
use think\model\relation\HasOne;

/**
 * @mixin \think\Model
 */
class MerchantProfiles extends BaseModel
{
    /**
     * @return HasOne
     */
    public function account(): HasOne
    {
        return $this->hasOne(MerchantAccounts::class);
    }
}