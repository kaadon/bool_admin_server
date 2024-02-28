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
 *   | Date:      [ 2024/2/28 ]
 *   +----------------------------------------------------------------------
 *   | 版权所有    [ 2020~2024 kaadon.com ]
 *   +----------------------------------------------------------------------
 **/

namespace app\common\model\member;

use app\common\model\SystemUuid;
use Kaadon\ThinkBase\BaseClass\BaseModel;

class MemberUuids extends BaseModel
{
    public static function getUuid(int $type = 1): string
    {
        try {
            //逻辑代码
            $prefix = chr(mt_rand(65, 90));
            do {
                $number = mt_rand(100000000, 999999999);
                $uid    = $prefix . $number;
            } while (!empty(self::where('uuid', '=', $uid)->find()));
            $bool = self::create([
                'type' => $type,
                'uuid' => $uid,
            ]);
            if (empty($bool)) {
                throw new \Exception("Sorry, the account number generation failed!");
            }
            return $uid;
        } catch (\Exception $exception) {
            throw new \Exception($exception->getMessage());
        }
    }

}