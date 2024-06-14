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
 *   | Date:      [ 2024/2/28 ]
 *   +----------------------------------------------------------------------
 *   | 版权所有    [ 2020~2024 kaadon.com ]
 *   +----------------------------------------------------------------------
 **/

namespace commands;

use commons\models\member\MemberAccounts;
use think\console\Command;

class Test extends Command
{
    protected function configure(): void
    {
        $this->setName('test')->setDescription('测试');
    }

    protected function execute($input, $output): void
    {
        var_dump((new MemberAccounts)->addMemberByEmail("kaadon.com@gmail.com","0",'127.0.0.1'));
    }


}