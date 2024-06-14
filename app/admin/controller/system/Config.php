<?php

namespace app\admin\controller\system;

use app\common\controller\AdminBase;
use think\App;
use think\facade\Log;
use think\response\Json;

/**
 * config控制器
 */
class Config extends AdminBase
{
    public function __construct(App $app)
    {
        parent::__construct($app);

        $this->model = new \app\common\model\system\SystemConfig();
    }

    /**
     *
     */
    public function index(): Json
    {
        try {
            $groupList = $this->model->getGroupList();
            foreach ($groupList as $k => $v) {
                $list = $this->model->field('name,title,value,remark')->where('group', $v['value'])->select();
                $detail = [];
                foreach ($list as $key => $val) {
                    /**
                     * 如果是上传类型的配置追加数据
                     */
                    if ($val['name'] == "upload_type") {
                        $val['extend'] = $this->ossArry();
                    }
                    $detail[$val['name']] = $val;
                }
                $groupList[$k]['detail'] = $detail;
            }
            return successes("success", $groupList);
        } catch (\Exception $e) {
            Log::write("get config index error:" . $e);
            return error('系统异常');
        }
    }

    private function _upload_ext(string $str): string
    {
        $array = explode(',', $str);
        $remove_items = array("php", "sh", "jsp");
        $result = array_udiff($array, $remove_items, 'strcasecmp');
        if (count($result) > 1) $result = array_unique($result);
        sort($result);
        return implode(',', $result);
    }

    public function update(): Json
    {
        try {
            $post = $this->request->post();
            foreach ($post as $key => &$val) {
                if (method_exists(self::class, '_' . $key)) $val = $this->{'_' . $key}($val);
                $this->model
                    ->where('name', $key)
                    ->update([
                        'value' => $val,
                    ]);
                redisCacheDel("config:{$key}");
            }
        } catch (\Exception $e) {
            return error('保存失败');
        }
        return successes('保存成功'.method_exists(self::class, '_' . $key));
    }

    public function getGroupList(): Json
    {
        return successes("success", $this->model->getGroupList());
    }

    /**
     * oss有哪些方式
     */
    public function ossArry(): array
    {
        $addons = ['qiniu', 'alioss', 'cos'];
        foreach ($addons as $k => $v) {
            if (!get_addons_config_format($v)) {
                unset($addons[$k]);
            }
        }

        array_unshift($addons, 'local');
        return $addons;
    }
}
