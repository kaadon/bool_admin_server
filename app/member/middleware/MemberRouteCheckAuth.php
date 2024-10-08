<?php
declare (strict_types = 1);

namespace app\member\middleware;

use resources\model\member\MemberAccounts;
use think\Request;
use think\Response;

class MemberRouteCheckAuth
{
    private array $auth_config = [
        'no_auth' => [
            'v1.login',
            'index',
            'services'
        ]
    ];
    /**
     * 处理请求
     *
     * @param \think\Request $request
     * @param \Closure $next
     * @return Response
     * @throws \Exception
     */
    public function handle(Request $request, \Closure $next): Response
    {
        try {
            $controller = parse_lower($request->controller());
            if (!in_array($controller , $this->auth_config['no_auth'])) {
                //验证逻辑
                $jwt  = jwt_verify();
                if (!isset($jwt->data->id)) {
                    return error('请登录后操作', 4001);
                }
                $request->account = MemberAccounts::getAccountById((int)$jwt->data->id);
            }
            //逻辑代码
        } catch (\Exception $exception) {
            return error(is_dev()?"错误:{$exception->getMessage()}":"请登录后操作", 4001);
        }
        return $next($request);
    }
}
