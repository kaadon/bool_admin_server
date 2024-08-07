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

namespace app\admin\middleware;

use think\Request;
use util\Token;

/*
 *登录校验中间件
 * @Date: 2021-05-26 13:59:06
 * @LastEditors: zs
 * @LastEditTime: 2021-05-26 13:59:28
 */

class CheckLogin
{
    public function handle(Request $request, \Closure $next)
    {
        $controller = parse_lower($request->controller());
        $node = $request->root() . "/" . parseNodeStr($request->controller() . '/' . $request->action());
        $auth_config = config('auth');
        $token = $request->header('token');
        //验证登录token
        if (!in_array($controller, $auth_config['no_login_controller']) && !in_array($node, $auth_config['no_login_node'])) {
            if (!$token) {
                return result(4001, 'token失效');
            }
            if (!Token::verify($token)) {
                return result(4001, 'token失效');
            }
        }
        return $next($request);
    }

}
