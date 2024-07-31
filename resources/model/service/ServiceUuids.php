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

namespace resources\model\service;

use resources\enum\AccountTypeEnum;
use Exception;
use Kaadon\ThinkBase\BaseClass\BaseModel;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;

/**
 *
 */
class ServiceUuids extends BaseModel
{
    /**
     * @throws ModelNotFoundException
     * @throws DataNotFoundException
     * @throws DbException
     * @throws Exception
     */
    public static function getUuid(AccountTypeEnum $uuidEnum, int $index = 1): string
    {
        do {
            $number = mt_rand(100000000, 999999999);
            $uid = $uuidEnum->value . $number;
        } while (!empty(self::where([
            ['uuid', '=', $uid],
            ['cate', '=', $uuidEnum->value]
        ])->find()));
        $ServiceUuids = new ServiceUuids();
        $bool = $ServiceUuids->save([
            'cate' => $uuidEnum->value,
            'uuid' => $uid,
        ]);
        if (empty($bool)) {
            if ($index < 3) {
                $index++;
                $uid = self::getUuid($uuidEnum, $index);
            } else {
                throw new Exception("Sorry, the UUID generation failed!");
            }
        }
        return $uid;
    }
    /**
     * 根据UUID 获取 账号枚举类型
     * @param string $uuid
     * @return \resources\enum\AccountTypeEnum
     * @throws \Exception
     */
    public static function getAccountType(string $uuid): AccountTypeEnum
    {
        $caseArr = array_filter(AccountTypeEnum::cases(), function ($case) use ($uuid) {
            return substr($uuid, 0, 2) == $case->uuidField();
        });
        if (empty($caseArr)) throw new \Exception("The UUID is incorrect");
        return array_values($caseArr)[0];
    }
}