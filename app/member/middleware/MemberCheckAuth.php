<?php
declare (strict_types = 1);

namespace app\member\middleware;

use resources\model\member\MemberAccounts;
use think\Request;
use think\Response;

class MemberCheckAuth
{
    private array $auth_config = [
        'no_auth' => [
            'v1.login',
            'index'
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
            //逻辑代码
            $controller = parse_lower($request->controller());
            if (!in_array($controller, $this->auth_config['no_auth'])) {
                //验证登录
                $jwtData = jwt_verify();
                $request->account = MemberAccounts::getAccountById($jwtData->data->id);
            }
            return $next($request);
        } catch (\Exception $exception) {
            return error("错误:{$exception->getMessage()}", 4001);
        }
    }
}
