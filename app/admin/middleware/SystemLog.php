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

use app\admin\model\system\SystemLog as ModelSystemLog;
use util\Token;

/*
 *系统日志中间件
 * @Date: 2021-05-26 13:59:06
 * @LastEditors: zs
 * @LastEditTime: 2021-05-26 13:59:28
 */

class SystemLog
{
    public function handle($request, \Closure $next)
    {

        if ($request->isPost()) {
            $method = strtolower($request->method());
            $token = $request->header('token');
            $url = $request->url();
            $ip = getRealIP();
            $params = $request->param();
            $adminId = Token::userId($token);
            $adminId = $adminId ? $adminId : 0;
            if ($adminId > 0) {
                $data = [
                    'admin_id' => $adminId,
                    'url' => $url,
                    'method' => $method,
                    'ip' => $ip,
                    'content' => json_encode($params, JSON_UNESCAPED_UNICODE),
                    'useragent' => $_SERVER['HTTP_USER_AGENT'],
                    'create_time' => time(),
                ];
                $modelSystemLog = new ModelSystemLog();
                $modelSystemLog->save($data);
            }
        }
        return $next($request);
    }

}
