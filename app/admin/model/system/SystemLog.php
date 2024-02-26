<?php
// +----------------------------------------------------------------------
// | kaadonadmin框架 [ kaadonadmin框架 ]
// +----------------------------------------------------------------------
// | 版权所有 2020~2024 kaadon.com
// +----------------------------------------------------------------------
// | 官方网站: https://kaadon.kaadon.com
// +----------------------------------------------------------------------
// | Author: kaadon <kaadon.com@gmail.com>
// +----------------------------------------------------------------------
namespace app\admin\model\system;

use Kaadon\ThinkBase\BaseClass\BaseModel;

/*
 * @Autor: zs
 * @Date: 2021-05-25 16:21:16
 * @LastEditors: zs
 * @LastEditTime: 2021-05-25 16:21:18
 */
class SystemLog extends BaseModel
{
    // 关闭自动写入update_time字段
    protected $updateTime = false;

    public function admin()
    {
        return $this->belongsTo('app\admin\model\system\SystemAdmin', 'admin_id', 'id');
    }

}
