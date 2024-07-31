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

namespace resources\model\merchant;

use resources\enum\CoinEnum;
use resources\model\member\enum\MerchantRecordBusinessEnum;
use resources\model\member\MemberWallets;
use Kaadon\ThinkBase\BaseClass\BaseModel;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\Model;
use think\model\relation\HasOne;

/**
 * @mixin Model
 */
class MerchantWallets extends BaseModel
{
    /**
     * @return HasOne
     */
    public function account(): HasOne
    {
        return $this->hasOne(MerchantAccounts::class);
    }

    /**
     * @param int $uid
     * @return array
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public static function getWallet(int $uid,?CoinEnum $coin = null): mixed
    {
        $wallet = (new self())->where([['uid', '=', $uid]])
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
    public static function walletCharge(MerchantWallets $MerchantWallet, MerchantRecordBusinessEnum $business, array $data, int $create_time, array $options = []): bool|MerchantWallets
    {
        if ($MerchantWallet->uid) throw new \Exception("THE AMOUNT DATA IS INCORRECT");
        $record_rows = [];
        $MemberWalletData = [];
        if (count($data)) throw new \Exception("THE AMOUNT DATA IS INCORRECT");
        foreach ($data as $key => $item) {
            // 数据不对
            if (count($item) != 3) {
                throw new Exception("THE AMOUNT DATA IS INCORRECT");
            }
            $coin = CoinEnum::tryFrom((int)$key);
            if (!$coin) throw new Exception("CURRENCIES DO NOT EXIST");

            /**数据有误**/
            if ($item[2] < 0) {
                throw new Exception("THE AMOUNT CHANGE CANNOT BE LESS THAN 0");
            }
            // 保存数据
            $record_rows[] = [
                'mid' => $MerchantWallet->uid,
                'currency' => $coin->value,
                'business' => $business->value,
                'before' => $item[0],
                'now' => $item[1],
                'after' => $item[2],
            ];

            if (!empty($optionsKeys)) foreach ($options as $optionKey => $option) {
                $optionData = MerchantRecordBusinessEnum::tryFrom($optionKey);
                if ($optionData) $record_rows[$optionData->value] = $option;
            }
            $MemberWalletData[$coin->name] = Db::raw($coin->name . '+' . $item[1]);
        }
        /*写入金额*/
        $MerchantWallet->save($MemberWalletData);
        /** 写入账变记录 **/
        $record = MerchantRecords::initialize($create_time)
            ->saveAll($record_rows);
        if ($record->isEmpty()) throw new \Exception("RECORD WRITE FAILED");
        return $MerchantWallet;
    }


}