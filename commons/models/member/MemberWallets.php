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
 *   | Date:      [ 2024/2/27 ]
 *   +----------------------------------------------------------------------
 *   | 版权所有    [ 2020~2024 kaadon.com ]
 *   +----------------------------------------------------------------------
 **/

namespace commons\models\member;

use commons\enum\RecordOptionsEnum;
use commons\enum\WalletCoinEnum;
use commons\models\member\enum\MemberRecordBusinessEnum;
use Exception;
use Kaadon\ThinkBase\BaseClass\BaseModel;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\facade\Db;
use think\Model;
use think\model\relation\HasOne;

/**
 * @mixin Model
 */
class MemberWallets extends BaseModel
{
    /**
     * @return HasOne
     */
    public function account(): HasOne
    {
        return $this->hasOne(MemberAccounts::class, 'id', 'mid');
    }


    /**
     * @param int $mid
     * @param WalletCoinEnum|null $coin
     * @return mixed
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public static function getWallet(int $mid,?WalletCoinEnum $coin = null): mixed
    {
        $wallet = (new self())->where([['mid', '=', $mid]])
            ->withoutField("id,delete_time,create_time,update_time")
            ->find();
        if (empty($wallet)) return null;
        if ($coin) {
            $coinKey = $coin->value;
            return $wallet->$coinKey;
        }else{
            return $wallet;
        }
    }

    /**
     * @throws Exception
     */
    public static function walletCharge(MemberWallets $MemberWallet, MemberRecordBusinessEnum $business, array $data, array $options = []): bool|MemberWallets
    {
        if (!isset($MemberWallet->mid)) throw new \Exception("THE AMOUNT DATA IS INCORRECT");
        $record_rows = [];
        $MemberWalletData = [];
        if (count($data) === 0) throw new \Exception("THE AMOUNT DATA IS INCORRECT");
        foreach ($data as $key => $item) {
            $coin = WalletCoinEnum::tryFrom((int)$key);
            if (!$coin) throw new Exception("CURRENCIES DO NOT EXIST");
            /**数据有误**/
            $coinName = $coin->name;
            // 保存数据
            $record_rows[] = [
                'mid' => $MemberWallet->mid,
                'currency' => $coin->value,
                'business' => $business->value,
                'before' => $MemberWallet->$coinName,
                'now' => $item,
                'after' => bcadd($MemberWallet->$coinName, $item,18),
            ];
            if (!empty($optionsKeys)) foreach ($options as $optionKey => $option) {
                $optionData = RecordOptionsEnum::tryFrom($optionKey);
                if ($optionData) $record_rows[$optionData->value] = $option;
            }
            $MemberWalletData[$coinName] = Db::raw($coinName . '+' . $item);
        }
        /*写入金额*/
        $MemberWallet->save($MemberWalletData);
        /** 写入账变记录 **/
        $record = MemberRecords::initialize()
            ->saveAll($record_rows);
        if ($record->isEmpty()) throw new \Exception("RECORD WRITE FAILED");
        return $MemberWallet;
    }

}