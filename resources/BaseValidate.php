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

namespace resources;

use Exception;
use Kaadon\CapCha\capcha;
use resources\logic\member\MemberLogic;
use resources\model\member\MemberAccounts;
use resources\model\member\MemberProfiles;
use resources\model\merchant\MerchantAccounts;
use resources\model\merchant\MerchantProfiles;
use think\Validate;

class BaseValidate extends Validate
{
    /**
     * 正则表达式过滤
     * @var array
     */
    protected $regex
        = [
            'path' => '/^\/[^\0]+$/',
            'realname' => '/^[\x80-\xff\.]{2,30}$/',
            'wechat' => '/^[a-zA-Z0-9_-]+$/',
        ];
    /**
     * 定义验证规则
     * 格式：'字段名'    =>    ['规则1','规则2'...]
     *
     * @var array
     */
    protected $rule
        = [
            'qq' => 'require|number',
            'mobile' => 'require|number',
            'email' => 'require|email',
            'cate|类型' => 'require',
            'username' => 'require',
            'nickname' => 'require|chsAlphaNum|length:6,32',
            'payment' => 'require|length:1,2|paymentNum',
            'old_password|原登录密码' => 'require',
            'password|登录密码' => 'require|alphaNum|length:6,32',
            'new_password|重复登录密码' => 'require|confirm:password',
            'old_safeword|原安全密码' => 'require',
            'safeword|安全密码' => 'require|number|length:6,32',
            'new_safeword|重复安全密码' => 'require|confirm:safeword',
            'inviter|邀请人' => 'require',
            'verify_code|数字验证码' => 'require|number|length:6|numberCode|requireWith:cate|requireWith:username',
            'realname' => 'require|regex:realname|length:2,16',
            'idcard' => 'require|idCard|length:18',
            'amount' => 'require|number|length:1,10',
            'wechat' => 'require|regex:wechat|length:4,32',
            'alipay' => 'require|length:4,32',
            'bankname' => 'require|chs|length:4,16',
            'bankcard' => 'require|number|length:15,20',//银行卡验证
            'verify_img_id|图形验证码ID' => 'requireWith:verify_img_code',//图片验证ID验证
            'verify_img_code|图形验证码值' => 'require|verifyImgCode',//图片验证码型验证
            'front' => 'require|regex:path',
            'back' => 'require|regex:path',
            'hold' => 'require|regex:path',
            'bank' => 'require',
        ];

    /**
     * 定义错误信息
     * 格式：'字段名.规则名'    =>    '错误信息'
     *
     * @var array
     */

    protected $message
        = [
            'email.require' => 'The email account cannot be empty',
            'mobile.require' => 'The mobile account cannot be empty',
            'email.email' => 'Incorrect email account format',
            'image.fileMime' => '文件类型只支持jpg,png,gif,jpeg,bmp格式',
            'file.fileMime' => '文件类型只支持rar,txt,mp3,mp4,apk,ipa格式',
            'realname.regex' => 'The name can only be a combination ',
            'wechat.regex' => 'WeChat can only be a combination of lowercase letters and',
            'avatar.regex' => 'The avatar path format is incorrect',
            'cardid.alphaNum' => 'It can only be 6-15 digits and letters',
            'front.regex' => 'The frontal photo of the ID card is incorrect',
            'back.regex' => 'The path format of the front photo of the ID card is incorrect',
            'hold.regex' => 'Handheld ID photo path format is incorrect',
            'mobile.mobile' => 'Must be a cell phone number',
            'verify_code.require' => 'SMS verification code must exist',
            'verify_code.number' => 'SMS verification code must be numbers',
            'verify_code.length' => 'SMS verification code length is 4',
            'newpassword.different' => 'Please enter a different password from the previous password',//为翻译
            'areacode.require' => 'International area code must exist',//为翻译
            'verify_type.require' => 'Validation type does not exist',//为翻译
        ];

    /**
     * 定义验证场景
     * UploadImage 上传图片验证场景
     * UploadFile 上传文件验证场景
     * @var array
     */
    protected $scene
        = [
            'UploadImage' => ['image'],
            'UploadFile' => ['file'],
        ];

    /**
     * 自定义验证规则
     * 判断用户存在或者不存在
     * @param $value
     * @param $rule
     * @return bool|string
     * @throws \Exception
     */
    protected function inviterExist($value, $rule): bool|string
    {
        try {
            //逻辑代码
            $inviter = MemberLogic::getInviter($value);
            if (empty($inviter)) return "Invitation code does not exist";
        } catch (\Exception $exception) {
            return $exception->getMessage();
        }
        return true;
    }


    public function UserExit($value, string $rule, array $data): bool|string
    {
        try {
            //逻辑代码
            $rules = explode(',', $rule);
            $account = MemberAccounts::getAccountById((int) $value);
            if (in_array('exist', $rules)) {
                return empty($account) ? "用户不存在" :true;
            }elseif (in_array('non-exist', $rules)) {
                return empty($account) ? true : '用户已存在';
            }
        } catch (\Exception $exception) {
            return $exception->getMessage();
        }
        return true;
    }

    /**
     * 自定义验证规则
     * 判断mobile用户存在或者不存在 唯一
     * @param $value
     * @param string $rule
     * @param array $data
     * @return bool|string
     */
    protected function usernameExist($value, string $rule, array $data): bool|string
    {
        try {
            //逻辑代码
            $rules = explode(',', $rule);
            $profile = MemberProfiles::getProfileByUsername($data['cate'], (string)$value);
            if (in_array('exist', $rules)) {
                if (empty($profile)) return "用户不存在";
                $account = MemberAccounts::getAccountById($profile->mid);
                if (in_array('status', $rules) && $account->status !== 1) return "用户被冻结";
                return true;
            }
            if (in_array('non-exist', $rules)) {
                return empty($profile) ? true : '用户已存在';
            }
        } catch (\Exception $exception) {
            return $exception->getMessage();
        }
        return true;
    }

    protected function merchantUsernameExist($value, string $rule, array $data): bool|string
    {
        try {
            //逻辑代码
            $rules = explode(',', $rule);
            $profile = MemberProfiles::getProfileByUsername($data['cate'], (string)$value);
            if (in_array('exist', $rules)) {
                if (empty($profile)) return "用户不存在";
                $account = MemberAccounts::getAccountById($profile->mid);
                if (in_array('status', $rules) && $account->status !== 1) return "用户被冻结";
                return true;
            }
            if (in_array('non-exist', $rules)) {
                return empty($profile) ? true : '用户已存在';
            }
        } catch (\Exception $exception) {
            return $exception->getMessage();
        }
        return true;
    }

    /**
     * 自定义验证规则
     * 判断短信验证码是否正确
     * @param $value
     * @param string $rule
     * @param array $data
     * @return bool|string
     */
    protected function numberCode($value, string $rule, array $data = []): bool|string
    {
        try {
            //逻辑代码
            $code = redisCacheGet("verify_code:{$data['cate']->name}:{$data['username']}");
            if ((int)$value !== (int)$code) return "验证码不正确";
            redisCacheDel("verify_code:{$data['cate']->name}:{$data['username']}");
        } catch (Exception $exception) {
            return $exception->getMessage();
        }
        return true;
    }


    /**
     * 自定义验证规则
     * 判断密码是否正确
     * @param $value
     * @param string $rule
     * @param array $data
     * @param string $name
     * @return bool|string
     */
    protected function memberVerifySecret($value, string $rule, array $data, string $name): bool|string
    {
        try {
            //逻辑代码
            if ((empty($data['cate']) || empty($data['username'])) && empty($data['mid'])) return "验证密码请提供[会员ID:mid]或者[cate:账号类型]和[账号:username]";
            if (!empty($data['mid'])){
                $account = MemberAccounts::getAccountById($data['mid']);
                if (empty($account)) return '用户不存在';
            }else{
                $profile = MemberProfiles::getProfileByUsername($data['cate'], (string)$data['username']);
                if (empty($profile)) return '用户不存在';
                $account = MemberAccounts::getAccountById($profile->mid);
            }
            if (str_contains($name, 'old')) {
                $old = true;
                $name = explode('old_', $name)[1];
            }
            if (password_verify($value, $account->$name)) return true;
            return (isset($old) ? '原' : '') . '密码错误';
        } catch (Exception $exception) {
            return $exception->getMessage();
        }
    }

    /**
     * 自定义验证规则{Merchant}
     * 判断密码是否正确
     * @param $value
     * @param string $rule
     * @param array $data
     * @param string $name
     * @return bool|string
     */
    protected function merchantVerifySecret($value, string $rule, array $data, string $name): bool|string
    {
        try {
            //逻辑代码
            $profile = (new MerchantProfiles())->where($data['cate'], (string)$data['username'])->find();
            if (empty($profile)) return '用户不存在';
            $account = MerchantAccounts::getAccountById($profile->uid);
            if (str_contains($name, 'old')) {
                $old = true;
                $name = explode('old_', $name)[1];
            }
            if (password_verify($value, $account->$name)) return true;
            return (isset($old) ? '原' : '') . '密码错误';
        } catch (Exception $exception) {
            return $exception->getMessage();
        }
    }

    /**
     * 自定义验证规则
     * 判断图片验证码是否正确
     * @param $value
     * @param string $rule
     * @param array $data
     * @param string $name
     * @return bool|string
     */
    protected function verifyImgCode($value, string $rule, array $data, string $name): bool|string
    {
        $check_verify = (new capcha())->check($data['verify_img_id'], $value);
        if (empty($check_verify)) {
            return "图片验证码已过期或错误";
        }
        return true;
    }


}