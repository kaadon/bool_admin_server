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

use resources\enum\AccountCateEnum;
use resources\enum\member\MemberAccountLevelEnum;
use resources\enum\StatusEnum;
use Exception;
use Kaadon\ThinkBase\BaseClass\BaseModel;
use Kaadon\ThinkBase\traits\ModelTrait;
use think\Model;
use think\model\relation\HasMany;
use think\model\relation\HasOne;

/**
 * @mixin \think\Model
 */
class MemberAccounts extends BaseModel
{
    use ModelTrait;

    /**
     * @throws Exception
     */
    public static function clearCache(Model $model): void
    {
        if (isset($model->id)) redisCacheDel('member_accounts:id:' . $model->id);
    }

    /**
     * @param string $inviterCode
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public static function fromInviter(string $inviterCode): mixed
    {
        return (new self())->where("uuid", $inviterCode)->find();
    }


    /**
     * 资料
     * @return HasOne
     */
    public function profile(): HasOne
    {
        return $this->hasOne(MemberProfiles::class, 'mid', 'id');
    }

    /**
     * 钱包
     * @return \think\model\relation\HasOne
     */
    public function wallet():HasOne
    {
        return $this->hasOne(MemberWallets::class,'mid','id');
    }
    /**
     * 变更记录
     * @return \think\model\relation\HasMany
     */
    public function record():HasMany
    {
        return $this->HasMany(MemberRecords::class,'mid','id');
    }
    /**
     * @param int $id
     * @return object
     * @throws Exception
     */
    public static function getAccountById(int $id): object
    {
        try {
            //逻辑代码
            $account = redisCacheGet('member_accounts:id:' . $id);
            if (!$account) {
                $account = (new self())->where('id',$id)->find();
                if (!empty($account)) {
                    $account = $account->toArray();
                    redisCacheSet('member_accounts:id:' . $id, $account, 3600);
                }
            }
            return (object)($account ?: []);
        } catch (\Exception $exception) {
            throw new \Exception($exception->getMessage());
        }
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
     * 获取会员等级 1 2 3 4 5
     * @return array
     */
    public static function getLevels(): array
    {
        $levels = [];
        foreach (MemberAccountLevelEnum::cases() as $case) {
            $levels[] = [
                'label' => $case->label(),
                'value' => $case->value,
            ];
        }
        return $levels;
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