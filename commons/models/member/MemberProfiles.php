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
 *   | Date:      [ 2024/2/27 ]
 *   +----------------------------------------------------------------------
 *   | 版权所有    [ 2020~2024 kaadon.com ]
 *   +----------------------------------------------------------------------
 **/

namespace commons\models\member;

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






}