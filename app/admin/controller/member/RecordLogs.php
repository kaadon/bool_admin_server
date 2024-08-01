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

namespace app\admin\controller\member;

use app\admin\AdminBase;
use resources\model\member\MemberRecords;
use resources\model\member\MemberWallets;
use think\App;
use think\response\Json;

class RecordLogs extends AdminBase
{
    protected bool $relationSearch = true;
    public function __construct(App $app)
    {
        parent::__construct($app);
        $this->model = new MemberRecords();
    }

    public function index(): Json
    {
        try {
            //逻辑代码
            list($limit, $where, $sortArr) = $this->buildTableParames();
            $sortArr['after'] = 'desc';
            $time = time();
            foreach ($where as $key => $item) {
                if ($item[0] === ($this->relationSearch ?humpToLine(lcfirst($this->model->getName())) .'.':'') .'time') {
                    $time = strtotime($item[2]);
                    unset($where[$key]);
                }
            }
            if (!$this->model::detectTable($time)) return error(date('Y年m月', $time). '无记录');
            $list = MemberRecords::initialize($time)
                ->withJoin('profile')
                ->where($where)
                ->order($sortArr)
                ->paginate($limit);
            return paginate($list, [
                'business' => $this->model::getRecordBusiness(),
                'currency' => MemberWallets::getWalletCoinCates()
            ]);
        } catch (\Exception $exception) {
            return error($exception->getMessage(), $exception->getCode(), $exception->getTrace());
        }
    }

}