<?php
/**
 *   +----------------------------------------------------------------------
 *   | PROJECT:   [ authapi_server ]
 *   +----------------------------------------------------------------------
 *   | 官方网站:   [ https://developer.kaadon.com ]
 *   +----------------------------------------------------------------------
 *   | Author:    [ kaadon.com <kaadon.com@gmail.com>]
 *   +----------------------------------------------------------------------
 *   | Tool:      [ PhpStorm ]
 *   +----------------------------------------------------------------------
 *   | Date:      [ 2024/6/20 ]
 *   +----------------------------------------------------------------------
 *   | 版权所有    [ 2020~2024 kaadon.com ]
 *   +----------------------------------------------------------------------
 **/

namespace app\member;

use app\BaseController;
use app\member\middleware\MemberV1BeforeInit;
use think\App;
use think\Middleware;

class MemberBase extends BaseController
{
    public function __construct(App $app)
    {
        parent::__construct($app);
    }
}