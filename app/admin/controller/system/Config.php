<?php

namespace app\admin\controller\system;

use app\admin\AdminBase;
use Exception;
use resources\model\system\SystemConfig;
use think\App;
use think\response\Json;

/**
 * config控制器
 */
class Config extends AdminBase
{
    public function __construct(App $app)
    {
        parent::__construct($app);
        $this->model = new SystemConfig();
        $this->validate = null;
    }

    /**
     *
     */
    public function index(): Json
    {
        try {
            $groupList = $this->model->getGroupList();
            foreach ($groupList as $k => $v) {
                $list = $this->model->field('name,title,value,remark,type,extend')->where('group', $v['value'])->select();
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
            return successes("success", ['list' => $groupList,'types' => $this->model->getConfigTypes()]);
        } catch (Exception $e) {
            return error($e->getMessage());
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

    public function add(): Json
    {
        if ($this->appdemo) return error('演示站点禁止添加');
        $post = $this->request->post();
        try {
            $this->validate && validate($this->validate)->check($post);
            $result = set_config($post['group'], $post['sign'], $post['value'], $post);
            if (!$result) throw new Exception('添加失败');
        } catch (Exception $e) {
            return error('添加失败:' . $e->getMessage());
        }
        return successes('添加成功！');
    }

    public function update(): Json
    {
        if ($this->appdemo) return error('演示站点禁止修改');
        try {
            $post = $this->request->post();
            $update = [];
            foreach ($post as $key => &$val) {
                if (method_exists(self::class, '_' . $key)) $val = $this->{'_' . $key}($val);
               $model = $this->model->where('name', $key)->find();
                $update[] = ['id' => $model->id, 'value' => $val,'group'=>$model->group,'sign'=>$model->sign];
            }
            $this->model->saveAll($update);
        } catch (Exception $e) {
            return error('保存失败');
        }
        return successes('保存成功');
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
