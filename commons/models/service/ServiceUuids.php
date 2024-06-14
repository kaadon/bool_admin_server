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

namespace commons\models\service;

use app\common\model\SystemUuid;
use commons\models\service\enum\UuidEnum;
use Kaadon\ThinkBase\BaseClass\BaseModel;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;

class ServiceUuids extends BaseModel
{
    /**
     * @throws ModelNotFoundException
     * @throws DataNotFoundException
     * @throws DbException
     */
    public static function getUuid(UuidEnum $uuidEnum, int $index = 1):string
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
                throw new \Exception("Sorry, the UUID generation failed!");
            }
        }
        return $uid;
    }
}