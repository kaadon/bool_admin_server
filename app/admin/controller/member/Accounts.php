<?php
/**
 *   +----------------------------------------------------------------------
 *   | PROJECT:   [ bool_admin_server ]
 *   +----------------------------------------------------------------------
 *   | 官方网站:   [ https://developer.kaadon.com ]
 *   +----------------------------------------------------------------------
 *   | Author:    [ kaadon <kaadon.com@gmail.com> codemiracle]
 *   +----------------------------------------------------------------------
 *   | Tool:      [ PhpStorm ]
 *   +----------------------------------------------------------------------
 *   | Date:      [ 2024/2/27 ]
 *   +----------------------------------------------------------------------
 *   | 版权所有    [ 2020~2024 kaadon.com ]
 *   +----------------------------------------------------------------------
 **/

namespace app\admin\controller\member;

use app\common\controller\AdminBase;
use app\common\model\member\MemberAccounts;
use think\App;
class Accounts extends AdminBase
{
    public function __construct(App $app)
    {
        parent::__construct($app);
        $this->model = new MemberAccounts();
    }
}