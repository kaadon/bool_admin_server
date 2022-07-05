<?php
namespace util;

use Exception;
use Firebase\JWT\JWT;
use Symfony\Component\VarDumper\Caster\Caster;
use think\facade\Cache;
use think\facade\Log;

class Token
{

    /**
     * 生成一个token
     */
    // public static function create($admin, $is_keeplogin = false)
    // {
    //     $jwt_config = config('auth.jwt');
    //     $key = $jwt_config['key'];
    //     $expire = $jwt_config['expire'];
    //     $keeplogin_expire = $jwt_config['keeplogin_expire'];
    //     $time = time();
    //     if ($is_keeplogin) {
    //         $expire = $keeplogin_expire;
    //     }
    //     $token = array(
    //         "iss" => $key, //签发者 可以为空
    //         "aud" => '', //面象的用户，可以为空
    //         "iat" => $time, //签发时间
    //         "exp" => $time + $expire, //token 过期时间
    //         "data" => $admin,
    //     );
    //     $jwt = JWT::encode($token, $key, "HS256"); //根据参数生成了 token
    //     return $jwt;
    // }

    public static function create($admin, $is_keeplogin = false)
    {
        $jwt_config = config('auth.jwt');

        $token=CommonTool::uuid();
        $fresh_token="fresh_".$token;
        $expire = $jwt_config['expire'];
        $keeplogin_expire = $jwt_config['keeplogin_expire'];
        if ($is_keeplogin) {
            $expire = $keeplogin_expire;
        }
    
        $admin['expire']=$expire;
        Cache::set($token,$admin,$expire);
        Cache::set($fresh_token,$admin,$expire*2);
        return $token;
    }
    /**
     * 验证
     */
    public static function verify($token)
    {
        if (!$token) {
            return false;
        }
        $admin=Cache::get($token);
        if(!$admin){
            $fresh_token="fresh_".$token;
            $admin=Cache::get($fresh_token);
            if($admin){
                Cache::set($token,$admin,$admin['expire']);
                Cache::set($fresh_token,$admin,$admin['expire']*2);
            }
        }
        if($admin){
            return true;
        }
        return false;
    }

    public static function userId($token)
    {
        if (!$token) {
            return false;
        }
        $admin=Cache::get($token);
        if(!$admin){
            $fresh_token="fresh_".$token;
            $admin=Cache::get($fresh_token);
            if($admin){
                Cache::set($token,$admin,$admin['expire']);
                Cache::set($fresh_token,$admin,$admin['expire']*2);
            }
        }
        if($admin){
            return $admin['id'];
        }
        return false;

    }

      /**
     * 获取用户信息
     */
    public static function admin($token)
    {
        if (!$token) {
            return false;
        }
        $admin=Cache::get($token);
        if(!$admin){
            $fresh_token="fresh_".$token;
            $admin=Cache::get($fresh_token);
            if($admin){
                Cache::set($token,$admin,$admin['expire']);
                Cache::set($fresh_token,$admin,$admin['expire']*2);
            }
        }
        if($admin){
            return $admin;
        }
        return false;

    }

    public static function is_superadmin($token)
    {
        if (!$token) {
            return false;
        }

        $admin=Cache::get($token);
        $config = config('auth');
        if(!$admin){
            $fresh_token="fresh_".$token;
            $admin=Cache::get($fresh_token);
            if($admin){
                Cache::set($token,$admin,$admin['expire']);
                Cache::set($fresh_token,$admin,$admin['expire']*2);
            }
        }
        if($admin){
           if( in_array($config['super_admin_group_id'], $admin['group_ids'])){
                return true;
            }
        }
        return false;

    }
    /**
     * 验证
     */
    // public static function verify($token)
    // {
    //     try {
    //         $key = config('auth.jwt.key');
    //         JWT::decode($token, $key, array('HS256'));
    //         return true;
    //     } catch (\Exception $e) {
    //         return false;
    //     }
    // }
    //获取用户id
    // public static function userId($token)
    // {
    //     if (!$token) {
    //         return false;
    //     }
    //     try {
    //         $key = config('auth.jwt.key');
    //         $decode = JWT::decode($token, $key, array('HS256'));
    //         $member_id = $decode->data->id;
    //         return $member_id;
    //     } catch (\Exception $e) {
    //         Log::error("--token userId error--" . $e);
    //         return false;
    //     }

    // }
    // /**
    //  * 获取用户信息
    //  */
    // public static function admin($token)
    // {
    //     if (!$token) {
    //         return false;
    //     }
    //     try {
    //         $key = config('auth.jwt.key');
    //         $decode = JWT::decode($token, $key, array('HS256'));
    //         return (array) $decode->data;
    //     } catch (\Exception $e) {
    //         Log::error("--token admin error--" . $e);
    //         return false;
    //     }

    // }

}
