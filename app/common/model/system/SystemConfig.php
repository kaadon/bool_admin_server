<?php

namespace app\common\model\system;



use app\common\model\BaseModel;

class SystemConfig extends BaseModel
{
    protected $name = "system_config";

    public function getGroupList()
    {
        return [['tab' => '基础配置', 'value' => 'site'], ['tab' => '上传配置', 'value' => 'upload']];
    }

}
