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

namespace resources\model\member;

use Kaadon\ThinkBase\traits\ModelTrait;
use resources\enum\RecordBusinessEnum;
use resources\enum\RecordOptionsEnum;
use resources\enum\CoinEnum;
use Exception;
use Kaadon\ThinkBase\BaseClass\BaseModel;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\facade\Db;
use think\Model;
use think\model\relation\HasMany;
use think\model\relation\HasOne;

/**
 * @mixin Model
 */
class MemberWallets extends BaseModel
{
    use ModelTrait;
    /**
     * 账户一对一关联
     * @return HasOne
     */
    public function account(): HasOne
    {
        return $this->hasOne(MemberAccounts::class, 'id', 'mid');
    }

    public function profile(): HasOne
    {
        return $this->hasOne(MemberProfiles::class, 'mid', 'mid');
    }

    /**
     * 获取余额
     * @param int $mid
     * @param CoinEnum|null $coin
     * @return mixed
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @throws \Exception
     */
    public static function getWallet(int $mid,?CoinEnum $coin = null): mixed
    {
        $wallet = (new self())->where([['mid', '=', $mid]])
            ->withoutField("id,delete_time,create_time,update_time")
            ->find();
        if (empty($wallet)) throw new \Exception('账户不存在');;
        if ($coin) {
            $coinKey = $coin->field();
            return $wallet->$coinKey;
        }else{
            return $wallet;
        }
    }

    /**
     * 账变金额
     * @throws Exception
     */
    public static function walletCharge(MemberWallets $MemberWallet, RecordBusinessEnum $business, array $data, array $options = []): bool
    {
        if (!isset($MemberWallet->mid)) throw new \Exception("THE AMOUNT DATA IS INCORRECT");
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
                'mid' => $MemberWallet->mid,
                'currency' => $coin->value,
                'business' => $business->value,
                'before' => $MemberWallet->$coinName,
                'now' => $item,
                'after' => bcadd($MemberWallet->$coinName, $item,18),
            ];
            foreach ($options as $optionKey => $option) {
                $optionData = RecordOptionsEnum::tryFrom($optionKey);
                if ($optionData) $record[$optionData->value] = $option;
            }
            $record_rows[] = $record;
            $MemberWalletData[$coinName] = Db::raw($coinName . '+' . $item);
        }
        /** 写入金额 **/
        $MemberWallet->save($MemberWalletData);
        /** 写入账变记录 **/
        $record = MemberRecords::initialize()
            ->saveAll($record_rows);
        if ($record->isEmpty()) throw new \Exception("RECORD WRITE FAILED");
        return true;
    }

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