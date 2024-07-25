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

use commons\models\member\enum\MemberAccountCateEnum;
use commons\models\member\enum\MemberAccountLevelEnum;
use Exception;
use Kaadon\ThinkBase\BaseClass\BaseModel;
use Kaadon\ThinkBase\traits\ModelTrait;
use think\facade\Db;
use think\Model;
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
        try {
            //逻辑代码
            redisCacheDel('member_accounts:id:' . $model->id);
        } catch (Exception $exception) {
            throw new Exception($exception->getMessage());
        }
    }
    public static function fromInviter(string $inviterCode): mixed
    {
        return (new self())->where("uuid", $inviterCode)->find();
    }

    /**
     * @return HasOne
     */
    public function profile(): HasOne
    {
        return $this->hasOne(MemberProfiles::class, 'mid', 'id');
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
     * 添加会员
     * @param string $email
     * @param string $inviterCode
     * @param string $register_ip
     * @param string $password
     * @param string $safeword
     * @return array
     * @throws Exception
     */
    public function addMemberByEmail(string $email, string $inviterCode, $register_ip = '0.0.0.0', string $password = "123456", string $safeword = "123456",): array
    {
        if (self::profile()->where(['email' => $email])->find()) throw new Exception('邮箱已存在');
        $inviter = self::where('uuid', $inviterCode)->find();
        if (empty($inviter) && $inviterCode !== "0") throw new \Exception('邀请人不存在');
        $accountData = [
            "floor" => $inviter ? $inviter->floor + 1 : 0,
            "inviter_line" => $inviter ? $inviter->inviter_line . "$inviter->id" : "0|",
            "agent_line" => $inviter ? $inviter->agent_line : "0|",
            'uuid' => MemberUuids::getUuid(1),
            'email' => $email,
            'inviter' => $inviterCode,
            'register_ip' => $register_ip,
            "safeword" => password_hash($password, PASSWORD_DEFAULT),
            "password" => password_hash($safeword, PASSWORD_DEFAULT),
        ];
        // 启动事务
        Db::startTrans();
        try {
            //逻辑代码
            $account = self::create($accountData);
            $profileData = [
                'account_main' => 1,
                'email' => $email,
            ];
            $profile = $account->profile()->save($profileData);
            // 提交事务
            Db::commit();
            return ['account' => $account->toArray(), 'profile' => $profile->toArray()];
        } catch (\Exception $exception) {
            // 回滚事务
            Db::rollback();
            throw new \Exception($exception->getMessage());
        }
    }

    public function updateMemberById(int $id, array $data): array
    {
        try {
            //逻辑代码
            $account = self::find($id);
            if (empty($account)) return [];
            $account->save($data);
            return ['account' => $account];
        } catch (\Exception $exception) {
            throw new \Exception($exception->getMessage());
        }
    }

    public function updateMemberProfileById(int $id, array $data): array
    {
        try {
            //逻辑代码
            $account = self::find($id);
            if (empty($account)) return [];
            $account->profile()->save($data);
            return ['profile' => $account->profile];
        } catch (\Exception $exception) {
            throw new \Exception($exception->getMessage());
        }
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
                'label' => lang($case->name),
                'value' => $case->value,
            ];
        }
        return $levels;
    }
}