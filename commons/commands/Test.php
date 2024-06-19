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

namespace commons\commands;

use commons\models\member\MemberAccounts;
use React\EventLoop\Loop;
use think\console\Command;

class Test extends Command
{
    protected function configure(): void
    {
        $this->setName('test')->setDescription('测试');
    }

    protected function execute($input, $output): void
    {
        Loop::addPeriodicTimer(1, function (){
            echo "没有数据";
        });
    }
}