<?php
declare (strict_types = 1);

namespace app\admin\listener;

use commons\models\system\SystemFiles;
use Kaadon\ThinkBase\interfaces\FileListenerInterface;

class Files implements FileListenerInterface
{
    /**
     * 事件监听处理
     *
     * @param array $params
     * @return void
     */
    public function handle(array $params): void
    {
        $systemFile = new SystemFiles();
        $systemFile->save($params);
    }
}
