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

namespace resources\logic\member;

use resources\enum\AccountCateEnum;
use resources\enum\AccountTypeEnum;
use resources\model\member\MemberAccounts;
use resources\model\member\MemberProfiles;
use resources\model\member\MemberWallets;
use resources\model\merchant\MerchantAccounts;
use resources\model\service\ServiceUuids;
use Exception;
use Kaadon\Uuid\Uuids;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\facade\Db;

/**
 * 会员逻辑控制器
 */
class MemberLogic
{
    /**
     * @param string|null $inviter
     * @param bool $is_admin 是否是管理员
     * @return array
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @throws Exception
     */
    public static function fromInviterData(?string $inviter, bool $is_admin = false): array
    {
        if (empty($inviter) && $is_admin) return [
            'floor' => 0,
            "inviter_line" => "0|",
            "agent_line" => "0|",
        ];
        if (empty($inviter)) throw new \Exception("邀请码不能为空");
        $inviterEnum = ServiceUuids::getAccountType($inviter);
        //逻辑代码
        $inviterFunc = match ($inviterEnum) {
            AccountTypeEnum::MERCHANT => function () use ($inviter) {
                $inviterData = (new MerchantAccounts)->where('uuid', $inviter)->find();
                if (empty($inviterData)) throw new \Exception("邀请码不正确");
                return [
                    'floor' => 0,
                    "inviter_line" => '0|',
                    "agent_line" => $inviterData->agent_line . $inviterData->id . '|',
                ];
            },
            AccountTypeEnum::MEMBER => function () use ($inviter) {
                $inviterData = (new MemberAccounts)->where('uuid', $inviter)->find();
                if (empty($inviterData)) throw new \Exception("邀请码不正确");
                return [
                    'floor' => $inviterData->floor + 1,
                    "inviter_line" => $inviterData->inviter_line . $inviterData->id . '|',
                    "agent_line" => $inviterData->agent_line,
                ];
            },
        };
        return $inviterFunc();
    }

    /**
     * @param string|null $inviter
     * @return array|null
     * @throws \Exception
     */
    public static function getInviter(string $inviter = null): ?array
    {
        if (empty($inviter)) return null;
        $inviterEnum = ServiceUuids::getAccountType($inviter);
        $inviterFunc = match ($inviterEnum) {
            AccountTypeEnum::MERCHANT => function () use ($inviter, $inviterEnum) {
                $inviterData = (new MerchantAccounts)->where(['uuid' => $inviter, 'status' => 1])->withJoin('profile')->find();
                if (empty($inviterData)) return null;
                return [
                    "type" => $inviterEnum->name,
                    "inviter" => $inviterData->uuid,
                    "email" => $inviterData->email,
                    "mobile" => $inviterData->mobile,
                ];
            },
            AccountTypeEnum::MEMBER => function () use ($inviter, $inviterEnum) {
                $inviterData = (new MemberAccounts)->where(['uuid' => $inviter, 'status' => 1])->withJoin('profile')->find();
                if (empty($inviterData)) return null;
                return [
                    "type" => $inviterEnum->name,
                    "inviter" => $inviterData->uuid,
                    "email" => $inviterData->email,
                    "mobile" => $inviterData->mobile,
                ];
            },
        };
        return $inviterFunc();
    }

    /**
     * 注册会员
     * @throws Exception
     */
    public static function AddMember(AccountCateEnum $AccountCateEnum, string $userName, string $password, ?string $inviter, bool $is_admin = false): bool
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
                "uuid" => AccountTypeEnum::MEMBER->getUuid(),
                "uid" => 0,
                "api_id" => Uuids::getUuid4(),
                "api_key" => password_hash($createTime, PASSWORD_DEFAULT),
                "inviter" => $inviter,
                "password" => password_hash($password, PASSWORD_DEFAULT),
                "safeword" => password_hash($password, PASSWORD_DEFAULT),
            ], $inviterData));
            /*创建用户资料*/
            (new MemberProfiles())->save([
                $AccountCateEnum->field() => $userName,
                'mid' => $account->id
            ]);
            /*创建用户钱包*/
            (new MemberWallets())->save([
                'mid' => $account->id
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