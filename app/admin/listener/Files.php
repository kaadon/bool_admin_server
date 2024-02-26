<?php
declare (strict_types = 1);

namespace app\admin\listener;

use app\common\model\system\SystemFiles;

class Files
{
    /**
     * 事件监听处理
     *
     * @param $param
     * @return mixed
     */
    public function handle($param): mixed
    {
        $systemFilse=new SystemFiles();
        $systemFilse->save($param);
    }
}
