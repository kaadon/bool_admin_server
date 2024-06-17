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

use commons\models\member\enum\MemberAccountCateEnum;
use commons\models\member\MemberAccounts;
use commons\models\member\MemberProfiles;
use commons\models\member\MemberWallets;
use commons\models\merchant\MerchantAccounts;
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
class MemberLogic
{
    /**
     * @param string $inviter
     * @param bool $is_admin 是否是管理员
     * @return array
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @throws Exception
     */
    public static function fromInviterData(string $inviter, bool $is_admin = false): array
    {
        if (empty($inviter) && $is_admin) {
            $inviteData = [
                'floor' => 0,
                "inviter_line" => "0|",
                "agent_line" => "0|",
            ];
        } else {
            $inviterCate = substr($inviter, 0, 2) ?? 'me';
            $inviterEnum = UuidEnum::tryFrom($inviterCate);
            if (!$inviterEnum) {
                throw new Exception("THE_INVITATION_CODE_IS_INCORRECT");
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
                        if (!env('INVITE_REQUIRE', false)) throw new Exception("AN_INVITATION_CODE_IS_REQUIRED");
                        $inviteData = [
                            'floor' => 0,
                            "inviter_line" => "0|",
                            "agent_line" => "0|",
                        ];
                }
            }
        }

        return $inviteData;
    }

    /**
     * 注册会员
     * @throws Exception
     */
    public static function AddMember(MemberAccountCateEnum $AccountCateEnum, string $userName, string $password, string $inviter, bool $is_admin = false): object
    {
        // 启动事务
        Db::startTrans();
        try {
            //逻辑代码
            $account = new MemberAccounts();
            $inviterData = self::fromInviterData($inviter, $is_admin);
            $createTime = time();
            $account->save(array_merge([
                "uuid" => ServiceUuids::getUuid(UuidEnum::Member),
                "uid" => 0,
                "api_id" => Uuids::getUuid4(),
                "api_key" => password_hash($createTime, PASSWORD_DEFAULT),
                "inviter" => $inviter,
                "password" => password_hash($password, PASSWORD_DEFAULT),
                "safeword" => password_hash($password, PASSWORD_DEFAULT),
            ], $inviterData));
            $profile = (new MemberProfiles())->save([
                $AccountCateEnum->name => $userName,
                "mid" => $account->id,
            ]);
            $wallet = (new MemberWallets())->save([
                'mid' => $account->id
            ]);
            // 提交事务
            Db::commit();
        } catch (Exception $exception) {
            echo $exception->getTraceAsString();
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
        ]);;
    }
}