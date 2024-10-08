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

namespace app\member\validate;

use resources\BaseValidate;

/**
 *
 */
class AccountValidate extends BaseValidate
{
    /**
     * 登录
     * @return AccountValidate
     */
    public function sceneLogin(): AccountValidate
    {
        return $this->only(['cate', 'username', 'password'])
            ->append('password', 'memberVerifySecret');
    }

    /**
     * 注册
     * @return AccountValidate
     */
    public function sceneRegister(): AccountValidate
    {
        return $this->only(['cate', 'username', 'password', 'new_password', 'inviter', 'verify_code'])
            ->append('inviter', 'inviterExist')
            ->append('username', 'usernameExist:non-exist');
    }

    /**
     * 修改密码
     * @return \app\member\validate\AccountValidate
     */
    public function sceneRetrievePassword(): AccountValidate
    {
        return $this->only(['cate', 'username', 'old_password', 'password', 'new_password', 'verify_code'])
            ->append('old_password', 'memberVerifySecret')
            ->append('password', 'different:old_password')
            ->append('username', 'usernameExist:exist')
            ->message(['password.different' => '和原密码不能相同']);
    }


    /**
     * 验证身份
     * @return \app\member\validate\AccountValidate
     */
    public function sceneAccountVerify(): AccountValidate
    {
        return $this->only(['id_card', 'front_image', 'back_image', 'real_name', "contact"])
            ->append([
                'id_card' => 'require|idCard',
                'contact' => 'require',
                'real_name' => 'require',
                'front_image' => 'require',
                'back_image' => 'require'
            ])
            ->message([
                'id_card.idCard' => '身份证号码错误',
            ]);
    }

    /**
     * 更新密码
     * @return \app\member\validate\AccountValidate
     */
    public function sceneUpdatePassword(): AccountValidate
    {
        return $this->only(['mid', 'old_password', 'password', 'new_password'])
            ->append([
                'mid' => 'require',
                'old_password' => 'requireWith:mid|memberVerifySecret',
                'password' => "different:old_password",
            ]);
    }

    /**
     * 更新安全码
     * @return \app\member\validate\AccountValidate
     */
    public function sceneUpdateSafeword(): AccountValidate
    {
        return $this->only(['mid', 'password', 'safeword', 'new_safeword'])
            ->append('password', 'requireWith:mid|memberVerifySecret');
    }


    /**
     * 更新个人资料
     * @return \app\member\validate\AccountValidate
     */
    public function sceneUpdateProfile(): AccountValidate
    {
        return $this->only(['mid', "nick_name", "country", "province", "city", "county"])
            ->append([
                'mid' => 'require',
                'nick_name' => 'require'
            ]);
    }

}