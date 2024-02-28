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

namespace app\common\model\member;

use Exception;
use Kaadon\ThinkBase\BaseClass\BaseModel;
use Kaadon\Uuid\Uuids;
use RedisException;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\facade\Db;
use think\Model;
use think\model\relation\HasOne;

/**
 * @mixin \think\Model
 */
class MemberAccounts extends BaseModel
{
    /**
     * @var string
     */
    private string $cacheKey = 'member_accounts:';

    /**
     * @throws Exception
     */
    public function clearCache(Model $model): void
    {
        try {
            //逻辑代码
            redisCacheDel($this->cacheKey . 'id:' . $model->id);
        } catch (Exception $exception) {
            throw new Exception($exception->getMessage());
        }
    }

    /**
     * @param int $id
     * @return array
     * @throws RedisException
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @throws Exception
     */
    public function getAccountById(int $id): array
    {
        try {
            //逻辑代码
            if (redisCacheGet($this->cacheKey . 'id:' . $id)) return redisCacheGet($this->cacheKey . 'id:' . $id);
            $account = $this->find($id);
            if (empty($account)) return [];
            $data = [
                'profile' => $account->profile->toArray(),
                'account' => $account->toArray()
            ];
            redisCacheSet($this->cacheKey . 'id:' . $id, $data, 3600);
            return $data;
        } catch (\Exception $exception) {
            throw new \Exception($exception->getMessage());
        }
    }

    /**
     * @return HasOne
     */
    public function profile(): HasOne
    {
        return $this->hasOne(MemberProfiles::class, 'mid', 'id');
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
        if (self::profile()->where(['email'=>$email])->find()) throw new Exception('邮箱已存在') ;
        $inviter = self::where('uuid',$inviterCode)->find();
        if(empty($inviter) && $inviterCode !== "0") throw new \Exception('邀请人不存在');
        $accountData = [
            "floor" => $inviter?$inviter->floor + 1:0,
            "inviter_line" => $inviter?$inviter->inviter_line ."$inviter->id":"0|",
            "agent_line" => $inviter?$inviter->agent_line:"0|",
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
}