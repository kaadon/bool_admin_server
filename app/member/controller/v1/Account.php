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
 *   | Date:      [ 2024/8/7 ]
 *   +----------------------------------------------------------------------
 *   | 版权所有    [ 2020~2024 kaadon.com ]
 *   +----------------------------------------------------------------------
 **/

namespace app\member\controller\v1;

use app\member\MemberBaseV1;
use app\member\MemberException;
use app\member\validate\AccountValidate;
use Exception;
use resources\enum\member\AccountCateEnum;
use resources\enum\StatusEnum;
use resources\model\member\MemberAccounts;
use resources\model\member\MemberProfiles;
use resources\model\member\MemberWallets;
use think\facade\Db;
use think\response\Json;

/**
 * Class Account
 */
class Account extends MemberBaseV1
{

    /**
     * @return \think\response\Json
     */
    public function getMemberInfo(): Json
    {
        //逻辑代码
        try {
            //逻辑代码
            return success([
                'account' => MemberAccounts::getAccountById($this->account->id),
                'profile' => MemberProfiles::getProfileByMid($this->account->id),
                'wallet' => MemberWallets::getWallet($this->account->id)
            ]);
        } catch (Exception $exception) {
            return error('获取失败', 201, is_dev() ? $exception->getMessage() : []);
        }
    }
    /**
     * 验证身份
     * @return Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function verify(): Json
    {
        if ($this->account->authen === 1) return error('已经认证过');
        if ($this->account->authen === 2) return error('实名正在审核中');
        try {
            //逻辑代码
            $post = $this->request->post();
            validate(AccountValidate::class)
                ->scene('AccountVerify')
                ->check($post);
            $updateData = [
                'id_card' => $post['id_card'],
                'real_name' => $post['real_name'],
            ];
            unset($post['id_card'], $post['real_name']);
            $updateData['verify'] = $post;
            $profile = (new MemberProfiles())->where('mid', $this->account->id)->find();
            $account = (new MemberAccounts())->find($this->account->id);
        } catch (\Exception $exception) {
            return error('提交失败:' . $exception->getMessage() );
        }
        // 启动事务
        Db::startTrans();
        try {
            //逻辑代码
            if (empty($profile->save($updateData))) throw new MemberException('提交失败:实名信息');
            if (empty($account->save([
                'authen' => StatusEnum::WAIT->value
            ]))) throw new MemberException('提交失败:实名状态');
            // 提交事务
            Db::commit();
        } catch (\Exception $exception) {
            // 回滚事务
            Db::rollback();
            return error('提交失败:' . $exception->getMessage());
        }
        return success();
    }
    /**
     * 修改密码
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException|\app\member\MemberException
     */
    public function updatePassword(): Json
    {
        $post = $this->request->post();
        $post['mid'] = $this->account->id;
        validate(AccountValidate::class)
            ->scene('UpdatePassword')
            ->check($post);
        $model = (new MemberAccounts())->find($this->account->id);
        $bool = $model->save([
            'password' => password_hash($post['password'], PASSWORD_DEFAULT)
        ]);
        if (empty($bool)) throw new MemberException('提交失败');
        return success();
    }
    /**
     * 修改安全码
     * @return Json
     * @throws \app\member\MemberException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function updateSafeword(): Json
    {
        $post = $this->request->post();
        $post['mid'] = $this->account->id;
        validate(AccountValidate::class)
            ->scene('UpdateSafeword')
            ->check($post);
        $accountModel = (new MemberAccounts())->find($this->account->id);
        $bool = $accountModel->save([
            'safeword' => password_hash($post['safeword'], PASSWORD_DEFAULT)
        ]);
        if (empty($bool)) throw new MemberException('提交失败');
        return success();
    }

    /**
     * 修改资料
     * @return Json
     * @throws \app\member\MemberException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function updateProfile(): Json
    {
        $post = $this->request->post();
        $post['mid'] = $this->account->id;
        foreach ($post as $key => $item) {
            if (!in_array($key, ['mid', "nick_name", "avatar", "country", "province", "city", "county"])) unset($post[$key]);
        }
        validate(AccountValidate::class)
            ->scene('UpdateProfile')
            ->check($post);
        $profile = (new MemberProfiles())->where('mid', $this->account->id)->find();
        unset($post['mid']);
        $bool = $profile->save([
            "nick_name" => $post['nick_name']??"",
            "avatar" => $post['avatar']??"",
            "country" => $post['country']??"",
            "province" => $post['province']??"",
            "city" => $post['city']??"",
            "county" => $post['county']??"",
        ]);
        if (empty($bool)) throw new MemberException('提交失败');
        return success();
    }

    public function getTeamMember(): Json
    {
        $post = $this->request->post();
        $where = [
            ['inviter_line', 'like', '%|' . $this->account->id . '|%']
        ];
        try {
            //逻辑代码
            if (isset($post['username'])) {
                $post['cate'] = isset($post['cate'])?AccountCateEnum::tryFrom($post['cate']):null;
                $profile = MemberProfiles::getProfileByUsername($post['cate'], $post['username']);
                if (empty($profile)) return error('用户不存在');
                $where[] = ['id', '=', $profile->mid];
            }
            return paginate((new MemberAccounts())->where($where)->where('floor',$this->account->floor + 1)->filter(function ($model) {
                $model->profile = $profile ?? MemberProfiles::getProfileByMid($model->id);
            })->withoutField('floor,agent_line,inviter_line,inviter,password,api_id,api_key,safeword,create_time,update_time,delete_time')->paginate());
       } catch (\Exception $exception) {
            return error('获取失败', 201, is_dev() ? $exception->getMessage() : []);
       }
    }
}