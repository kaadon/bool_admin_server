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
 *   | Date:      [ 2024/2/27 ]
 *   +----------------------------------------------------------------------
 *   | 版权所有    [ 2020~2024 kaadon.com ]
 *   +----------------------------------------------------------------------
 **/

namespace commons\models\merchant;

use Exception;
use Kaadon\ThinkBase\BaseClass\BaseModel;
use RedisException;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\Model;
use think\model\relation\HasOne;

/**
 * @mixin Model
 */
class MerchantAccounts extends BaseModel
{
    /**
     * @var string
     */
    private string $cacheKey = 'merchant_accounts:';

    /**
     * @param Model $model
     * @return void
     * @throws RedisException|Exception
     */
    public function clearCache(Model $model): void
    {
        try {
            //逻辑代码
            redisCacheDel($this->cacheKey . 'id:' . $model->id);
        } catch (Exception $exception) {
            throw new Exception($exception->getMessage());
        }
    }

    /**
     * @param int $id
     * @return array
     * @throws RedisException
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @throws Exception
     */
    public function getAccountById(int $id): array
    {
        try {
            //逻辑代码
            if (redisCacheGet($this->cacheKey . 'id:' . $id)) return redisCacheGet($this->cacheKey . 'id:' . $id);
            $account = $this->find($id);
            if (empty($account)) return [];
            $data = [
                'profile' => $account->profile->toArray(),
                'account' => $account->toArray()
            ];
            redisCacheSet($this->cacheKey . 'id:' . $id, $data, 3600);
            return $data;
        } catch (\Exception $exception) {
            throw new \Exception($exception->getMessage());
        }
    }

    /**
     * @return HasOne
     */
    public function profile(): HasOne
    {
        return $this->hasOne(MerchantProfiles::class,'uid','id');
    }
}