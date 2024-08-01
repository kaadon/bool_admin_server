<?php
/**
 *   +----------------------------------------------------------------------
 *   | PROJECT:   [ authapi_server ]
 *   +----------------------------------------------------------------------
 *   | 官方网站:   [ https://developer.kaadon.com ]
 *   +----------------------------------------------------------------------
 *   | Author:    [ kaadon.com <kaadon.com@gmail.com>]
 *   +----------------------------------------------------------------------
 *   | Tool:      [ PhpStorm ]
 *   +----------------------------------------------------------------------
 *   | Date:      [ 2024/6/23 ]
 *   +----------------------------------------------------------------------
 *   | 版权所有    [ 2020~2024 kaadon.com ]
 *   +----------------------------------------------------------------------
 **/

namespace resources\model\merchant;


use resources\enum\RecordBusinessEnum;
use Kaadon\ThinkBase\BaseClass\BaseModel;
use resources\model\member\MemberAccounts;
use think\facade\Db;
use think\model\relation\BelongsTo;
use think\model\relation\HasOne;

/**
 *
 */
class MerchantRecords extends BaseModel
{

    /**
     * @return \think\model\relation\HasOne
     */
    public function account(): HasOne
    {
        return $this->HasOne(MemberAccounts::class, 'mid', 'id');
    }

    /**
     * @param int|null $time
     *
     * @return static
     */
    public static function initialize(int $time = null): static
    {
        if (is_null($time)) $time = time();
        $check = self::detectTable($time);
        if (empty($check)) {
            $sql = self::getCreateSql($time);
            Db::execute($sql);
        }
        return (new self())->setSuffix("_" . date("Ym", $time));
    }

    /**
     * @param int|null $time
     *
     */
    public static function detectTable(int $time = null): bool
    {
        if (is_null($time)) $time = time();
        $tableName = (new self())->getTable() . "_" . date('Ym', $time);
        $check = Db::query("show tables like '{$tableName}'");
        if (empty($check)) return false;
        return true;
    }

    /**
     * @param int|null $time
     * @return string
     */
    private static function getCreateSql(?int $time = null): string
    {
        if (is_null($time)) $time = time();
        $oldMoonTime = strtotime(date('Y-m', $time) . "-1") - 86400;
        $oldMoonTable = self::getTable() . "_" . date('Ym', $oldMoonTime);
        $check = Db::query("show tables like '{$oldMoonTable}'");
        if (empty($check)) {
            $AUTO_INCREMENT = 1;
        } else {
            $AUTO_INCREMENT = self::initialize($oldMoonTime)
                ->order("id DESC")
                ->value("id");
            if (empty($AUTO_INCREMENT)) {
                $AUTO_INCREMENT = 1;
            } else {
                $AUTO_INCREMENT += 1;
            }
        }
        $tableSuffix = date('Ym', time());
        $tableName = self::getTable() . "_" . $tableSuffix;
        return <<<EOT
CREATE TABLE `{$tableName}` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `mid` varchar(11) CHARACTER SET utf8 NOT NULL COMMENT '用户账号',
  `currency` tinyint(4) NOT NULL COMMENT '具体货币;见 WalletCoinEnum',
  `business` tinyint(4) NOT NULL COMMENT '具体业务:见 RecordBusinessEnum',
  `before` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '原本货币数量',
  `now` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '本次执行货币数量',
  `after` decimal(30,12) unsigned NOT NULL DEFAULT '0.000000000000' COMMENT '最后货币数量',
  `system` tinyint(1) NOT NULL DEFAULT '1' COMMENT '系统补充:1正常,0系统',
  `remark` varchar(255) DEFAULT '0' COMMENT ' 记录 订单之类ID',
  `from` varchar(255) DEFAULT '0' COMMENT '来自某位成员\n',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `currency` (`currency`) USING BTREE,
  KEY `business` (`business`) USING BTREE,
  KEY `now` (`now`) USING BTREE,
  KEY `mid` (`mid`) USING BTREE,
  KEY `after` (`after`) USING BTREE,
  KEY `before` (`before`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT={$AUTO_INCREMENT} DEFAULT CHARSET=utf8mb4 COMMENT='用户账变记录 - {$tableName}';
EOT;
    }


    /**
     * @return array
     */
    public static function getRecordBusiness(): array
    {
        return array_map(function ($case) {
            return [
                'value' => $case->value,
                'label' => $case->label()
            ];
        }, RecordBusinessEnum::cases());
    }
}