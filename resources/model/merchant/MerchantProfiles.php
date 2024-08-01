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

namespace resources\model\merchant;

use Kaadon\ThinkBase\BaseClass\BaseModel;
use Kaadon\ThinkBase\traits\ModelTrait;
use resources\enum\AccountCateEnum;
use think\Model;
use think\model\relation\HasOne;

/**
 * @mixin Model
 */
class MerchantProfiles extends BaseModel
{
    use ModelTrait;

    /**
     * @throws \Exception
     */
    public static function clearCache(Model $model): void
    {
        if (isset($model->mobile)) redisCacheDel('merchant_profiles:username:' . $model->mobile);
        if (isset($model->email)) redisCacheDel('merchant_profiles:username:' . $model->email);
        if (isset($model->uid)) redisCacheDel('merchant_profiles:uid:' . $model->uid);
    }

    /**
     * @return HasOne
     */
    public function account(): HasOne
    {
        return $this->hasOne(MerchantAccounts::class, 'id', 'uid');
    }

    /**
     * @return \think\model\relation\HasOne
     */
    public function wallet():HasOne
    {
        return  $this->hasOne(MerchantWallets::class, 'uid', 'uid');
    }


    /**
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \Exception
     */
    public static function getProfileByUid(int $uid): ?object
    {
        $profile = redisCacheGet("merchant_profiles:uid:$uid");
        if (!$profile) {
            $profile = (new self())->where('uid', $uid)->find();
            if (!empty($profile)) {
                $profile = $profile->toArray();
                redisCacheSet("merchant_profiles:uid:$uid", $profile, 3600);
            }
        }
        return $profile ? (object)$profile : null;
    }


    /**
     * @param \resources\enum\AccountCateEnum $accountCate
     * @param string $username
     * @return object|null
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \Exception
     */
    public static function getProfileByUsername(AccountCateEnum $accountCate, string $username): ?object
    {
        $profile = redisCacheGet("merchant_profiles:$username");
        if (!$profile) {
            $profile = (new self())->where($accountCate->name, $username)->find();
            if (!empty($profile)) {
                $profile = $profile->toArray();
                redisCacheSet("merchant_profiles:$username", $profile, 3600);
            }
        }
        return $profile ? (object)$profile : null;
    }
}