<?php
// +----------------------------------------------------------------------
// | kaadonadmin框架 [ kaadonadmin框架 ]
// +----------------------------------------------------------------------
// | 版权所有 2020~2024 kaadon.com
// +----------------------------------------------------------------------
// | 官方网站: https://kaadon.kaadon.com
// +----------------------------------------------------------------------
// | Author: kaadon <kaadon.com@gmail.com>
// +----------------------------------------------------------------------
namespace app\admin\controller;

use app\admin\model\system\SystemAdmin;
use app\admin\model\system\SystemGroup;
use app\admin\model\system\SystemGroupAdmin;
use app\admin\service\AuthService;
use app\admin\AdminBase;
use think\App;
use think\facade\Cache;
use think\response\Json;
use util\Token;

/*
 * @Description: Do not edit
 * @Date: 2021-05-25 14:57:43
 */
class Passport extends AdminBase
{
    public function test(): void
    {
        echo 0;
    }

    public function index(): Json
    {
        $post = $this->request->post();
        $key = isset($post['key']) ? $post['key'] : '';
        $code = isset($post['code']) ? $post['code'] : '';
        if ($key && $code) {
            if (!capcha_check($key,$code)) {
                return error('验证码不正确');
            }
        } else {
            return error('请输入验证码');
        }
        $admin = SystemAdmin::where(['username' => $post['username']])->find();
        if (empty($admin)) {
            return error('用户不存在');
        }
        if (md5($post['password']) != $admin->password) {
            return error('密码输入有误');
        }
        if ($admin->status == 0) {
            return error('账号已被禁用');
        }
        $is_keeplogin = isset($post['is_keeplogin']) ? $post['is_keeplogin'] : false;
        $group_ids = SystemGroupAdmin::where('admin_id', $admin['id'])->column('group_id');
        $admin['group_ids'] = $group_ids;
        unset($admin['password']);
        
        $token = Token::create($admin->toArray(), $is_keeplogin);

        return successes('登录成功', ['admin' => $admin, 'token' => $token]);
    }

    public function logout(): Json
    {
        return successes('退出登录成功');
    }

    public function userinfo(): Json
    {
        $token = $this->request->header('token');
        $adminId = Token::userId($token);
        if (!$adminId) {
            return result(4001, 'token失效');
        }

        $admin = SystemAdmin::where(['id' => $adminId])->find();
        if (empty($admin)) {
            return error('用户不存在');
        }
        $groups = "";
        $group_ids = SystemGroupAdmin::where('admin_id', $admin['id'])->column('group_id');
        $group = SystemGroup::field('name')
            ->where('status', 1)
            ->where('id', 'in', $group_ids)
            ->select();
        $i = 0;
        foreach ($group as $v) {
            $groups = $i == 0 ? $v['name'] : $groups . ',' . $v['name'];
            $i++;
        }
        $admin['groups_name'] = $groups;
        unset($admin['password']);
        $data['admin'] = $admin;

        $auth_service = new AuthService($admin['id'], $group_ids);
        $auths = $auth_service->getPermission();
        $data['permissions'] = $auths;
        return successes('获取用户信息成功', $data);
    }
    /**
     * 更新用户信息
     */
    public function update(): Json
    {
        $token = $this->request->header('token');
        $adminId = Token::userId($token);
        if (!$adminId) {
            return result(4001, 'token失效');
        }

        $admin = SystemAdmin::where(['id' => $adminId])->find();
        if (empty($admin)) {
            return error('用户不存在');
        }
        $post = $this->request->post();
        isset($post['phone']) && $admin->phone = $post['phone'];
        isset($post['head_image']) && $admin->head_image = $post['head_image'];
        isset($post['email']) && $admin->email = $post['email'];
        isset($post['nickname']) && $admin->nickname = $post['nickname'];
        if (isset($post['password'])) {
            $old_password = isset($post['old_password']) ? $post['old_password'] : '';
            $confirm_password = isset($post['confirm_password']) ? $post['confirm_password'] : '';
            if (md5($old_password) != $admin['password']) {
                return error('旧密码不正确！');
            }
            if ($confirm_password != $post['password']) {
                return error('两次密码不一致！');
            }
        }
        isset($post['password']) && $admin->password = md5($post['password']);
        $admin->save();
        return successes('更新用户信息成功！');
    }
}
