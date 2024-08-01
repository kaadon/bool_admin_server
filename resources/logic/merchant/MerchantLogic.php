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
 *   | Date:      [ 2024/6/14 ]
 *   +----------------------------------------------------------------------
 *   | 版权所有    [ 2020~2024 kaadon.com ]
 *   +----------------------------------------------------------------------
 **/

namespace resources\logic\merchant;

use resources\enum\AccountCateEnum;
use resources\enum\AccountTypeEnum;
use resources\model\merchant\MerchantAccounts;
use resources\model\merchant\MerchantProfiles;
use resources\model\merchant\MerchantWallets;
use resources\model\service\ServiceUuids;
use Exception;
use Kaadon\Uuid\Uuids;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\facade\Db;

/**
 *
 */
class MerchantLogic
{
    /**
     * @param string $inviter
     * @param bool $is_admin
     * @return array
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @throws \Exception
     */
    public static function fromAgentData(string $inviter, bool $is_admin = false): array
    {
        if (empty($inviter) && $is_admin) return [
            'floor' => 0,
            "inviter_line" => "0|",
            "agent_line" => "0|",
        ];
        if (empty($inviter)) throw new \Exception("邀请码不能为空");
        $inviterEnum = ServiceUuids::getAccountType($inviter);
        if ($inviterEnum !== AccountTypeEnum::MERCHANT) throw new \Exception("邀请码不正确");
        //逻辑代码
        $inviterData = (new MerchantAccounts)->where('uuid', $inviter)->find();
        if (empty($inviterData)) throw new \Exception("邀请人不存在");
        return [
            'floor' => 0,
            "inviter_line" => '0|',
            "agent_line" => $inviterData->agent_line . $inviterData->id . '|',
        ];
    }

    /**
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \Exception
     */
    public static function getAgent($inviter): ?array
    {
        if (empty($inviter)) return null;
        $inviterEnum = ServiceUuids::getAccountType($inviter);
        if ($inviterEnum !== AccountTypeEnum::MERCHANT) return null;
        $inviterData = (new MerchantAccounts)->where(['uuid' => $inviter, 'status' => 1])->withJoin('profile')->find();
        if (empty($inviterData)) return null;
        return [
            'floor' => $inviterData->floor,
            'inviter' => $inviter,
            "agent_line" => $inviterData->agent_line
        ];
    }


    /**
     * 注册代理
     * @throws Exception
     */
    public static function AddMerchant(AccountCateEnum $AccountCateEnum, string $userName, string $password, string $agentUuid, bool $is_admin = false, array $data = []): bool
    {
        // 启动事务
        Db::startTrans();
        try {
            //逻辑代码
            $account = new MerchantAccounts();
            $inviterData = self::fromAgentData($agentUuid, $is_admin);
            /*创建用户主体*/
            $account->save(array_merge([
                "uuid" =>  AccountTypeEnum::MERCHANT->getUuid(),
                "api_id" => Uuids::getUuid4(),
                "api_key" => md5($userName),
                "password" => password_hash($password, PASSWORD_DEFAULT),
                "safeword" => password_hash($password, PASSWORD_DEFAULT),
            ], $inviterData));
            /*创建用户资料*/
            (new MerchantProfiles())->save([
                $AccountCateEnum->name => $userName,
                'mid' => $account->id
            ]);
            /*创建用户钱包*/
            (new MerchantWallets())->save([
                'uid' => $account->id
            ]);
            // 提交事务
            Db::commit();
        } catch (Exception $exception) {
            // 回滚事务
            Db::rollback();
            throw new Exception($exception->getMessage());
        }
        return true;
    }
}