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

namespace resources\enum;

use resources\model\system\ExchangeRate;
use resources\ResourceException;
use think\facade\Cache;

/**
 * 钱包币种 枚举
 * Class CoinEnum
 * @package resources\enum
 */
enum CoinEnum: int
{
    case RMB = 1;
    case USD = 2;
    case TRX = 3;
    case USDT = 4;
    case ETH = 5;
    case BTC = 6;
    case SYSTEM = 99;


    /**
     * @return string
     */
    public function label(): string
    {
        return match ($this) {
            self::RMB => '人民币',
            self::USD => '美元',
            self::TRX => 'TRX',
            self::USDT => 'USDT',
            self::ETH => 'ETH',
            self::BTC => 'BTC',
            self::SYSTEM => '金币',
        };
    }

    /**
     * @return string
     */
    public function unit(): string
    {
        return match ($this) {
            self::RMB => '¥',
            self::USD => '$',
            self::TRX => 'TRX',
            self::USDT => 'USDT',
            self::ETH => 'ETH',
            self::BTC => 'BTC',
            self::SYSTEM => '金币',
        };
    }

    /**
     * @return string
     */
    public function field(): string
    {
        return match ($this) {
            self::RMB => 'rmb',
            self::USD => 'usd',
            self::TRX => 'trx',
            self::USDT => 'usdt',
            self::ETH => 'eth',
            self::BTC => 'btc',
            self::SYSTEM => 'system',
        };
    }

    /**
     * @param \resources\enum\CoinEnum $targetCoin
     * @return string
     * @throws \resources\ResourceException
     */
    public function getExchangeRate(CoinEnum $targetCoin): string
    {
        if ($this === $targetCoin) return "1";
        $rate = Cache::get('exchange_rate:' . $targetCoin->label() . '-' . $this->label());
        if ($rate) return $rate;
        if ($this === self::SYSTEM) {
            $rate = ExchangeRate::where('coin', $targetCoin->value)->value('rate') ?: throw new ResourceException('未找到' . $targetCoin->label() . '汇率');
        } else {
            $currentCoinRate = ExchangeRate::where('coin', $this->value)->value('rate') ?: throw new ResourceException('未找到' . $this->label() . '汇率');
            $targetCoinRate = ExchangeRate::where('coin', $targetCoin->value)->value('rate') ?: throw new ResourceException('未找到' . $targetCoin->label() . '汇率');
            $rate = bcdiv($currentCoinRate, $targetCoinRate, 4);
        }
        Cache::set('exchange_rate:' . $targetCoin->label() . '-' . $this->label(), $rate, 3600);
        return $rate;
    }
}
