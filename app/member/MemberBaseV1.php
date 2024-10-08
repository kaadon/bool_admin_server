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

use think\App;

class MemberBaseV1 extends MemberBase
{
    public object $account;
    public function __construct(App $app)
    {
        parent::__construct($app);
        if (isset($this->request->account)) $this->account = $this->request->account;
    }
}