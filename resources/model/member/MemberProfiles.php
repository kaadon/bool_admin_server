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

namespace resources\model\member;

use Exception;
use Kaadon\ThinkBase\BaseClass\BaseModel;
use Kaadon\ThinkBase\traits\ModelTrait;
use resources\enum\AccountCateEnum;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\Model;
use think\model\relation\HasMany;
use think\model\relation\HasOne;

/**
 * @mixin Model
 */
class MemberProfiles extends BaseModel
{
    use ModelTrait;
    // 设置json类型字段
    /**
     * @var string[]
     */
    protected $json = ['verify'];
    // 设置JSON数据返回数组
    /**
     * @var bool
     */
    protected $jsonAssoc = true;

    /**
     * @throws \Exception
     */
    public static function clearCache(Model $model): void
    {
        if (isset($model->mobile)) redisCacheDel('member_profiles:username:' . $model->mobile);
        if (isset($model->email)) redisCacheDel('member_profiles:username:' . $model->email);
        if (isset($model->mid)) redisCacheDel('member_profiles:mid:' . $model->mid);
    }

    /**
     * @return HasOne
     */
    public function account(): HasOne
    {
        return $this->hasOne(MemberAccounts::class, 'id', 'mid');
    }

    /**
     * @return mixed
     */
    public function wallet():HasOne
    {
        return $this->hasOne(MemberWallets::class, 'mid', 'mid');
    }

    /**
     * @return \think\model\relation\HasMany
     */
    public function record():HasMany
    {
        return $this->hasMany(MemberRecords::class, 'mid', 'mid');
    }



    /**
     * @throws ModelNotFoundException
     * @throws DbException
     * @throws DataNotFoundException
     * @throws Exception
     */
    public static function getProfileByMid(int $mid): ?object
    {
        $profile = redisCacheGet('member_profiles:mid:' . $mid);
        if (!$profile) {
            $profile = (new self())->where('mid', $mid)
                ->withoutField('create_time,update_time,delete_time')
                ->find();
            if (!empty($profile)) {
                $profile = $profile->toArray();
                redisCacheSet('member_profiles:mid:' . $mid, $profile, 3600);
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
        $profile = redisCacheGet("member_profiles:$username");
        if (!$profile) {
            $profile = (new self())->where($accountCate->name, $username)->find();
            if (!empty($profile)) {
                $profile = $profile->toArray();
                redisCacheSet("member_profiles:$username", $profile, 3600);
            }
        }
        return $profile ? (object)$profile : null;
    }

}