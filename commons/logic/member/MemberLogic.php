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

namespace commons\logic\member;

use commons\models\member\enum\AccountCateEnum;
use commons\models\member\MemberAccounts;
use commons\models\member\MemberProfiles;
use commons\models\member\MemberWallets;
use commons\models\merchant\MerchantAccounts;
use commons\models\service\enum\UuidEnum;
use commons\models\service\ServiceUuids;
use Kaadon\Uuid\Uuids;
use think\facade\Db;

class MemberLogic
{
    public static function fromInviterData(string $inviter): array
    {
        $inviterCate = substr($inviter, 0, 2);
        $inviterEnum = UuidEnum::tryFrom($inviterCate);
        if (!$inviterEnum) {
            throw new \Exception("THE_INVITATION_CODE_IS_INCORRECT");
        } else {
            switch ($inviterEnum->value) {
                case UuidEnum::Merchant->value:
                    $inviter = MerchantAccounts::where('uuid', $inviter)->find();
                    if (!empty($inviter)) $inviteData = [
                        'floor' => 0,
                        "inviter_line" => '0|',
                        "agent_line" => $inviter->agent_line . '|' . $inviter->id,
                    ];
                case UuidEnum::Member->value:
                    $inviter = MemberAccounts::where('uuid', $inviter)->find();
                    if (!empty($inviter)) $inviteData = [
                        'floor' => $inviter->floor + 1,
                        "inviter_line" => $inviter->inviter_line . '|' . $inviter->id,
                        "agent_line" => $inviter->agent_line,
                    ];
                default:
                    if (env('INVITE_REQUIRE', false)){
                        $inviteData = [
                            'floor' => 0,
                            "inviter_line" => "0|",
                            "agent_line" => "0|",
                        ];
                    }else{
                        throw new \Exception("AN_INVITATION_CODE_IS_REQUIRED");
                    }
            }
            if (empty($inviter)) throw new \Exception("THE_INVITATION_CODE_IS_INCORRECT");
        }
        return $inviteData;
    }

    /**
     * @throws \Exception
     */
    public static function AddMember(AccountCateEnum $AccountCateEnum, string $userName, string $password, string $inviter): object
    {
        // 启动事务
        Db::startTrans();
        try {
            //逻辑代码
            $account = new MemberAccounts();
            $inviterData = self::fromInviterData($inviter);
            $createTime = time();
            $account->save(array_merge([
                "uuid" => ServiceUuids::getUuid(UuidEnum::Member),
                "uid" => 0,
                "api_id" => Uuids::getUuid4(),
                "api_key" => md5($userName),
                "inviter" => $inviter,
                "password" => password_hash($password, PASSWORD_DEFAULT),
                "safeword" => password_hash($password, PASSWORD_DEFAULT),
            ], $inviterData));
            $profile = new MemberProfiles();
            $profile->save([
                $AccountCateEnum->value => $userName,
                "mid" => $account->id,
            ]);
            $wallet = new MemberWallets();
            $wallet->save([
                'mid' => $account->id
            ]);
            // 提交事务
            Db::commit();
        } catch (\Exception $exception) {
            echo $exception->getTraceAsString();
            // 回滚事务
            Db::rollback();
            throw new \Exception($exception->getMessage());
        }
        unset($account->password);
        unset($account->safeword);
        $memberData = new \stdClass();
        $memberData->account = $profile;
        $memberData->profile = $account;
        return $memberData;
    }
}