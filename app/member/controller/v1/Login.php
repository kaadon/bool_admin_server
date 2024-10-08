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
 *   | Date:      [ 2024/7/4 ]
 *   +----------------------------------------------------------------------
 *   | 版权所有    [ 2020~2024 kaadon.com ]
 *   +----------------------------------------------------------------------
 **/

namespace app\member\controller\v1;

use app\member\MemberBase;
use app\member\MemberException;
use app\member\validate\AccountValidate;
use Exception;
use resources\enum\member\AccountCateEnum;
use resources\enum\StatusEnum;
use resources\logic\member\MemberLogic;
use resources\model\member\MemberAccounts;
use resources\model\member\MemberProfiles;
use resources\model\member\MemberWallets;
use think\response\Json;

/**
 * Class Login
 * Title 登录
 */
class Login extends MemberBase
{
    /**
     * 获取用户分类
     * @return Json
     */
    public function getMemberCates(): Json
    {
        $cates = MemberAccounts::getCates();
        $cates = array_filter($cates, function ($cate) {
           return $cate['value'] !== 0;
        });
        return success($cates);
    }
    /**
     * 登录
     * @return Json
     */
    public function login(): Json
    {
        try {
            if ($this->request->header('uniappid') && ($this->request->header('appversioncode',"") === "" || $this->request->header('appversioncode',1) < 1020001)) {
                return error('你的app版本太旧,请升级到最新版本');
            }
            //逻辑代码
            $post = $this->request->post();
            $post['cate'] = isset($post['cate'])? AccountCateEnum::tryFrom((int)$post['cate']) : null;
            validate(AccountValidate::class)
                ->scene('Login')
                ->check($post);
            $profile = MemberProfiles::getProfileByUsername($post['cate'], $post['username']);
            if (!$profile) throw new MemberException('账号不存在');
            $userdata = [
                'profile' => $profile
            ];
            $account = MemberAccounts::getAccountById($profile->mid);
            if ($account->status !== StatusEnum::NORMAL->value) throw new MemberException('账号已被禁用: ' . $account->remark,4001);
            unset($account->password);
            unset($account->safeword);
            $userdata['account'] = MemberAccounts::handleLevel($account);
            $userdata['wallet'] = MemberWallets::getWallet($profile->mid);
            $userdata['token'] = 'kaadon ' . jwt_create($account->uuid, [
                    'id' => $profile->mid,
                    'uuid' => $account->uuid,
                ]);
            return success($userdata);
        } catch (Exception $exception) {
            return error($exception->getMessage());
        }
    }

    /**
     * 注册
     * @throws MemberException
     */
    public function register(): Json
    {
        try {
            //逻辑代码
            $post = $this->request->post();
            $post['cate'] = isset($post['cate'])? AccountCateEnum::tryFrom((int)$post['cate']) : null;
            validate(AccountValidate::class)
                ->scene('Register')
                ->check($post);
            MemberLogic::AddMember($post['cate'], $post['username'], $post['password'], $post['inviter']);
            return success([]);
        } catch (Exception $exception) {
            throw new MemberException($exception->getMessage());
        }
    }

    /**
     * 修改密码
     * @throws MemberException
     */
    public function retrieve_password(): Json
    {
        try {
            //逻辑代码
            $post = $this->request->post();
            $post['cate'] = isset($post['cate'])? AccountCateEnum::tryFrom((int)$post['cate']) : null;
            validate(AccountValidate::class)
                ->scene('RetrievePassword')
                ->check($post);
            $profile = MemberProfiles::getProfileByUsername($post['cate'], $post['username']);
            $account = (new MemberAccounts)->find($profile->mid);
            $account->password = password_hash($post['password'], PASSWORD_DEFAULT);
            $account->save();
            unset($account->password);
            unset($account->safeword);
            return success($account);
        } catch (Exception $exception) {
            throw new MemberException($exception->getMessage());
        }
    }

}