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

use Exception;
use Kaadon\ThinkBase\BaseClass\BaseModel;
use Kaadon\ThinkBase\traits\ModelTrait;
use RedisException;
use resources\enum\AccountCateEnum;
use resources\enum\StatusEnum;
use think\Model;
use think\model\relation\HasMany;
use think\model\relation\HasOne;

/**
 * @mixin Model
 */
class MerchantAccounts extends BaseModel
{
    use ModelTrait;

    /**
     * @param Model $model
     * @return void
     * @throws RedisException|Exception
     */
    public function clearCache(Model $model): void
    {
        if (isset($model->id)) redisCacheDel('merchant_accounts:id:' . $model->id);
    }

    /**
     * @return HasOne
     */
    public function profile(): HasOne
    {
        return $this->hasOne(MerchantProfiles::class, 'uid', 'id');
    }

    /**
     * @return \think\model\relation\HasOne
     */
    public function wallet():HasOne
    {
        return $this->hasOne(MerchantWallets::class, 'uid', 'id');
    }


    /**
     * @param int $id
     * @return object|null
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \Exception
     */
    public static function getAccountById(int $id): ?object
    {
        //逻辑代码
        $account = redisCacheGet('merchant_accounts:id:' . $id);
        if (empty($account)) {
            $account = (new self())->where('id', $id)->find();
            if (!empty($account)) {
                $account = $account->toArray();
                redisCacheSet('merchant_accounts:id:' . $id, $account, 3600);
            }
        }
        return $account ? (object)$account : null;
    }

    /**
     * 获取会员注册类型 mobile email
     * @return array
     */
    public static function getCates(): array
    {
        $cates = [];
        foreach (AccountCateEnum::cases() as $case) {
            $cates[] = [
                'label' => $case->label(),
                'value' => $case->value,
            ];
        }
        return $cates;
    }

    /**
     * 获取会员状态 -1 1 2
     * @return array
     */
    public static function getStatus(): array
    {
        $levels = [];
        foreach (StatusEnum::cases() as $case) {
            $levels[] = [
                'label' => $case->label(),
                'value' => $case->value,
            ];
        }
        return $levels;
    }
}