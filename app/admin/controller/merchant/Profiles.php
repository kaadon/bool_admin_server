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
 *   | Date:      [ 2024/6/19 ]
 *   +----------------------------------------------------------------------
 *   | 版权所有    [ 2020~2024 kaadon.com ]
 *   +----------------------------------------------------------------------
 **/

namespace app\admin\controller\merchant;

use app\admin\AdminBase;
use resources\enum\AccountCateEnum;
use resources\logic\merchant\MerchantLogic;
use resources\model\merchant\MerchantAccounts;
use resources\model\merchant\MerchantProfiles;
use think\App;
use think\exception\ValidateException;
use think\response\Json;

class Profiles extends AdminBase
{
    protected bool $relationSearch = true;
    public function __construct(App $app)
    {
        parent::__construct($app);
        $this->model = new MerchantProfiles();
        $this->validate = [];
    }
    /**
     * 列表
     */
    public function index(): Json
    {
        try {
            //逻辑代码
            list($limit, $where, $sortArr) = $this->buildTableParames();
            $list = $this->model
                ->withJoin('account')
                ->where($where)
                ->order($sortArr)
                ->paginate($limit);
            return paginate($list,[
                "cates" => MerchantAccounts::getCates(),
                "status" => MerchantAccounts::getStatus()
            ]);
        } catch (\Exception $exception) {
            return error($exception->getMessage());
        }
    }
    public function add(): Json
    {
        $post = $this->request->post();
        try {
            $this->validate && validate($this->validate)->check($post);
            $cate = AccountCateEnum::tryFrom((int)$post['cate']);
            if (empty($cate)) throw new \Exception('注册类型不存在...');
            $result = MerchantLogic::AddMerchant($cate, $post['username'], $post['password'], $post['inviter']??null, true);
            if ($result) {
                return successes('添加成功！');
            }
            return error('添加失败');
        } catch (ValidateException $e) {
            return error($e->getError());
        } catch (\Exception $e) {
            return error('添加失败:' . $e->getMessage());
        }
    }

    public function delete(): Json
    {
        return error('站不支持删除用户');
    }

    public function getOptions(): Json
    {
        return successes('', [
            "cates" => MerchantProfiles::getCates(),
        ]);
    }

    /**
     * @throws \Exception
     */
    public function getAgent():Json
    {
        return successes('', MerchantLogic::getAgent($this->request->post('inviter/s', '')));
    }
}