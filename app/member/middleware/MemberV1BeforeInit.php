<?php
declare (strict_types = 1);

namespace app\member\middleware;

use think\Request;
use think\Response;

class MemberV1BeforeInit
{
    /**
     * 处理请求
     *
     * @param \think\Request $request
     * @param \Closure       $next
     * @return Response
     */
    public function handle(Request $request, \Closure $next): Response
    {
        //
        return $next($request);
    }
}
