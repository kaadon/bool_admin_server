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
            if (empty($inviter)) throw new \Exception("THE_INVITATION_CODE_IS_INCORRECT");
            $inviterCate = substr($inviter, 0, 2) ?? 'me';
            $inviterEnum = UuidEnum::tryFrom($inviterCate);
            if (!$inviterEnum) {
                throw new Exception("THE_INVITATION_CODE_IS_INCORRECT");
            } else {
                switch ($inviterEnum->value) {
                    case UuidEnum::Merchant->value:
                        $inviter = MerchantAccounts::where('uuid', $inviter)->find();
                        if (!empty($inviter)) throw new \Exception("THE_INVITATION_CODE_IS_INCORRECT");
                        $inviteData = [
                            'floor' => 0,
                            "inviter_line" => '0|',
                            "agent_line" => $inviter->agent_line . '|' . $inviter->id,
                        ];
                        break;
                    case UuidEnum::Member->value:
                        $inviter = MemberAccounts::where('uuid', $inviter)->find();
                        if (empty($inviter)) throw new \Exception("THE_INVITATION_CODE_IS_INCORRECT");
                        $inviteData = [
                            'floor' => $inviter->floor + 1,
                            "inviter_line" => $inviter->inviter_line . '|' . $inviter->id,
                            "agent_line" => $inviter->agent_line,
                        ];
                        break;
                    default:
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

    public static function getInviter(string $inviter = null): array
    {
        if (empty($inviter)) return [];
        $inviterCate = substr($inviter, 0, 2) ?? 'me';
        $inviterEnum = UuidEnum::tryFrom($inviterCate);
        if (!$inviterEnum) return [];
        switch ($inviterEnum->value) {
            case UuidEnum::Merchant->value:
                $inviter = MerchantAccounts::where(['uuid' => $inviter, 'status' => 1])->withJoin('profile')->find();
                if (empty($inviter)) $inviter = [];
                $inviter = [
                    "type" => $inviterEnum->name,
                    "inviter" => $inviter->uuid,
                    "username" => $inviter->profile[UuidEnum::from($inviter->profile->account_main)->name],
                ];
                break;
            case UuidEnum::Member->value:
                $inviter = MemberAccounts::where(['uuid' => $inviter, 'status' => 1])->withJoin('profile')->find();
                if (empty($inviter)) $inviter = [];
                $inviter = [
                    "type" => $inviterEnum->name,
                    "inviter" => $inviter->uuid,
                    "username" => $inviter->profile[MemberAccountCateEnum::from($inviter->profile->account_main)->name],
                ];
                break;
            default:
                $inviter = [];
        }
        return $inviter;
    }

    /**
     * 注册会员
     * @throws Exception
     */
    public static function AddMember(MemberAccountCateEnum $AccountCateEnum, string $userName, string $password, string $inviter, bool $is_admin = false, array $data = []): object
    {
        // 启动事务
        Db::startTrans();
        try {
            //逻辑代码
            $account = new MemberAccounts();
            $inviterData = self::fromInviterData($inviter, $is_admin);
            $createTime = time();

            /*创建用户主体*/
            $account->save(array_merge([
                "uuid" => ServiceUuids::getUuid(UuidEnum::Member),
                "uid" => 0,
                "api_id" => Uuids::getUuid4(),
                "api_key" => password_hash($createTime, PASSWORD_DEFAULT),
                "inviter" => $inviter,
                "password" => password_hash($password, PASSWORD_DEFAULT),
                "safeword" => password_hash($password, PASSWORD_DEFAULT),
            ], $inviterData));

            /*创建用户资料*/
            $profileDate = [];
            if ($AccountCateEnum->value === MemberAccountCateEnum::system->value && $is_admin) {
                foreach (MemberAccountCateEnum::cases() as $case) {
                    if (array_key_exists($case->name, $data)) $profileDate[$case->name] = $data[$case->name];
                }
                if (empty($profileDate)) throw new \Exception("参数不全");
            }else{
                $profileDate[$AccountCateEnum->name] = $userName;
            }
            $profileDate['account_main'] = $AccountCateEnum->value;
            $profileDate['mid'] = $account->id;
            $profile = (new MemberProfiles())->save($profileDate);

            /*创建用户钱包*/
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