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
 *   | Date:      [ 2024/6/14 ]
 *   +----------------------------------------------------------------------
 *   | 版权所有    [ 2020~2024 kaadon.com ]
 *   +----------------------------------------------------------------------
 **/

namespace commons\logic\merchant;

use commons\models\member\MemberProfiles;
use commons\models\member\MemberWallets;
use commons\models\merchant\enum\MerchantAccountCateEnum;
use commons\models\merchant\MerchantAccounts;
use commons\models\merchant\MerchantProfiles;
use commons\models\merchant\MerchantWallets;
use commons\models\service\enum\UuidEnum;
use commons\models\service\ServiceUuids;
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
     * @return array
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public static function fromAgentData(string $inviter,$is_admin = false): array
    {
        $inviterCate = substr($inviter, 0, 2);
        $inviterEnum = UuidEnum::tryFrom("me");
        if (!$inviterEnum) {
            throw new Exception("THE_INVITATION_CODE_IS_INCORRECT");
        }
        $inviter = MerchantAccounts::where('uuid', $inviter)->find();
        if (empty($inviter)) {
            if (!$is_admin) {
                throw new \Exception("THE_INVITATION_CODE_IS_INCORRECT");
            } else {
                $inviteData = [
                    'floor' => "0",
                    "agent_line" => "0|",
                ];
            }
        } else {
            $inviteData = [
                'floor' => $inviter->floor + 1,
                "agent_line" => $inviter->agent_line,
            ];
        }

        return $inviteData;
    }

    /**
     * 注册代理
     * @throws Exception
     */
    public static function AddMerchant(MerchantAccountCateEnum $AccountCateEnum, string $userName, string $password, string $agentUuid,bool $is_admin=false): object
    {
        // 启动事务
        Db::startTrans();
        try {
            //逻辑代码
            $account = new MerchantAccounts();
            $inviterData = self::fromAgentData($agentUuid,$is_admin);
            $createTime = time();
            $account->save(array_merge([
                "uuid" => ServiceUuids::getUuid(UuidEnum::Merchant),
                "api_id" => Uuids::getUuid4(),
                "api_key" => md5($userName),
                "password" => password_hash($password, PASSWORD_DEFAULT),
                "safeword" => password_hash($password, PASSWORD_DEFAULT),
            ], $inviterData));
            $profile = (new MerchantProfiles())->save([
                $AccountCateEnum->name => $userName,
                "uid" => $account->id,
            ]);
            $wallet = (new MerchantWallets())->save([
                'uid' => $account->id
            ]);
            // 提交事务
            Db::commit();
        } catch (Exception $exception) {
            // 回滚事务
            Db::rollback();
            throw new Exception($exception->getMessage());
        }
        unset($account->password);
        unset($account->safeword);
        return new \stdClass([
            'profile' => $profile,
            'account' => $account,
            'wallet' => $wallet
        ]);
    }
}