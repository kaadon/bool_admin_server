<?php
/**
 *   +----------------------------------------------------------------------
 *   | PROJECT:   [ machine01_server ]
 *   +----------------------------------------------------------------------
 *   | 官方网站:   [ https://developer.kaadon.com ]
 *   +----------------------------------------------------------------------
 *   | Author:    [ kaadon.com <kaadon.com@gmail.com>]
 *   +----------------------------------------------------------------------
 *   | Tool:      [ PhpStorm ]
 *   +----------------------------------------------------------------------
 *   | Date:      [ 2024/7/17 ]
 *   +----------------------------------------------------------------------
 *   | 版权所有    [ 2020~2024 kaadon.com ]
 *   +----------------------------------------------------------------------
 **/

namespace app\admin\controller\merchant;

use app\admin\AdminBase;
use resources\enum\CoinEnum;
use resources\enum\RecordBusinessEnum;
use resources\model\merchant\MerchantWallets;
use think\App;
use think\response\Json;

class Wallet extends AdminBase
{
    protected bool $relationSearch = true;

    public function __construct(App $app)
    {
        parent::__construct($app);
        $this->model = new MerchantWallets();
    }

    public function index(): Json
    {
        try {
            //逻辑代码
            list($limit, $where, $sortArr) = $this->buildTableParames();
            $list = $this->model
                ->withJoin([
                    'profile' => ['mobile', 'email']
                ])
                ->where($where)
                ->order($sortArr)
                ->paginate($limit);
            return paginate($list, [
                'coins' => $this->model::getWalletCoinCates(),
            ]);
        } catch (\Exception $exception) {
            return error($exception->getMessage());
        }
    }

    /**
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \Exception
     */
    public function changeWallet(): Json
    {
        //逻辑代码
        $post = $this->request->post();
        $this->validate($post, [
            'mid' => 'require',
            'amount' => 'require',
            'remark' => 'chsAlphaNum',
        ],[
            'mid.require' => '会员ID不能为空',
            'amount.require' => '金额不能为空',
            'remark.chsAlphaNum' => '备注只能是中文、字母和数字',
        ]);
        $row = $this->model::getWallet($post['mid']);
        if (empty($row)) return error('数据不存在');
        $bool = $this->model::walletCharge($row, RecordBusinessEnum::SYSTEM_CHANGE, [
            CoinEnum::SYSTEM->value => $post['amount']
        ], [
            'remark' => $post['remark'] ?? ('系统' . ($post['amount'] > 0 ? '充值' : '扣除')),
        ]);
        if (empty($bool)) return error('赠送失败');
        return successes();
    }
}