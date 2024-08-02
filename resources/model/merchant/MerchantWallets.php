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

use Exception;
use Kaadon\ThinkBase\BaseClass\BaseModel;
use resources\enum\CoinEnum;
use resources\enum\RecordBusinessEnum;
use resources\enum\RecordOptionsEnum;
use think\facade\Db;
use think\Model;
use think\model\relation\HasMany;
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
        return $this->hasOne(MerchantAccounts::class, 'id', 'uid');
    }

    /**
     * @return HasOne
     */
    public function profile(): HasOne
    {
        return $this->hasOne(MerchantProfiles::class, 'uid', 'uid');
    }


    /**
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \Exception
     */
    public static function getWallet(int $uid, ?CoinEnum $coin = null): mixed
    {
        $wallet = (new self())->where([['uid', '=', $uid]])
            ->withoutField("id,delete_time,create_time,update_time")
            ->find();
        if (empty($wallet)) throw new \Exception('账户不存在');;
        if ($coin) {
            $coinKey = $coin->field();
            if (!isset($wallet->$coinKey)) throw new \Exception('币种不存在');
            return $wallet->$coinKey;
        }else{
            return $wallet;
        }
    }

    /**
     * @throws \Exception
     */
    public static function walletCharge(MerchantWallets $wallet, RecordBusinessEnum $business, array $data, array $options = []): bool
    {
        if (!isset($wallet->uid)) throw new \Exception("THE WALLET DOES NOT EXIST");
        $record_rows = [];
        $MemberWalletData = [];
        if (count($data) === 0) throw new \Exception("THE AMOUNT DATA IS INCORRECT");
        foreach ($data as $key => $item) {
            $coin = CoinEnum::tryFrom((int)$key);
            if (!$coin) throw new Exception("CURRENCIES DO NOT EXIST");
            /**数据有误**/
            $coinName = $coin->field();
            // 保存数据
            $record = [
                'uid' => $wallet->uid,
                'currency' => $coin->value,
                'business' => $business->value,
                'before' => $wallet->$coinName,
                'now' => $item,
                'after' => bcadd($wallet->$coinName, $item,18),
            ];
            foreach ($options as $optionKey => $option) {
                $optionData = RecordOptionsEnum::tryFrom($optionKey);
                if ($optionData) $record[$optionData->value] = $option;
            }
            $record_rows[] = $record;
            $MemberWalletData[$coinName] = Db::raw($coinName . '+' . $item);
        }
        /** 写入金额 **/
       $bool = $wallet->save($MemberWalletData);
       if (empty($bool)) throw new \Exception("AMOUNT WRITE FAILED");
        /** 写入账变记录 **/
        $record = MerchantRecords::initialize()
            ->saveAll($record_rows);
        if ($record->isEmpty()) throw new \Exception("RECORD WRITE FAILED");
        return true;
    }

    /**
     * @return array
     */
    public static function getWalletCoinCates(): array
    {
        return array_map(function ($case){
            return [
                'value' => $case->value,
                'label' => $case->label(),
                'unit' => $case->unit(),
            ];
        },CoinEnum::cases());
    }
}