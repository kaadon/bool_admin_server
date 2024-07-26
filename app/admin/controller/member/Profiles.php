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

namespace app\admin\controller\member;

use app\admin\AdminBase;
use commons\enum\AccountCateEnum;
use commons\enum\StatusEnum;
use commons\Jobs\MemberJobs;
use commons\logic\member\MemberLogic;
use commons\models\member\enum\MemberAccountAuthenEnum;
use commons\models\member\enum\MemberAccountCateEnum;
use commons\models\member\enum\MemberTeamCateEnum;
use commons\models\member\MemberAccounts;
use commons\models\member\MemberProfiles;
use think\App;
use think\exception\ValidateException;
use think\response\Json;

class Profiles extends AdminBase
{
    protected bool $relationSearch = true;

    public function __construct(App $app)
    {
        parent::__construct($app);
        $this->model = new MemberProfiles();
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
            return paginate($list, [
                "cates" => MemberAccounts::getCates(),
                "levels" => MemberAccounts::getLevels(),
                "status" => MemberAccounts::getStatus()
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
            MemberLogic::AddMember($cate, $post['username'], $post['password'], $post['inviter'] ?? null, true);
        } catch (\Exception $e) {
            return error('添加失败:' . $e->getMessage());
        }
        return successes('添加成功');
    }

    public function getOptions(): Json
    {
        return successes('', [
            "cates" => MemberAccounts::getCates(),
            "levels" => MemberAccounts::getLevels()
        ]);
    }

    public function getInviter(): Json
    {
        return successes('', MemberLogic::getInviter($this->request->param('inviter/s', "")));
    }

    public function delete(): Json
    {
        return error('占时不支持删除操作');
    }
    public function authen(): Json
    {
        $post = $this->request->post();
        $post['authen'] = isset($post['authen'])? StatusEnum::tryFrom($post['authen']) : null;
        if (empty($post['authen'])) return error('认证状态错误');
        try {
            $account = (new MemberAccounts())->where([
                'id' => $post['mid'],
                'authen' => StatusEnum::WAIT->value
            ])->find();
            if (empty($account)) return error('会员不存在或已认证');
            if ($post['authen'] == StatusEnum::DISABLE) {
                $account->authen =$post['authen']->value;
                $account->save();
                $profile = $account->profile;
                $profile->save([
                    'verify' => null
                ]);
            } else {
                $account->authen = StatusEnum::NORMAL->value;
                $account->save();
                $account->inviter_line = line_array($account->inviter_line, '|', true);
            }
            return successes('认证成功');
        } catch (\Exception $e) {
            return error('添加失败:' . $e->getMessage());
        }
    }

}