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

    /**
     * @param string $group
     * @param string $sign
     * @return mixed|null
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public static function get_config(string $group, string $sign)
    {
        $value  = null;
        $config = redisCacheGet("config:{$group}_{$sign}");
        if ( empty($config) ) {
            $config = self::where([
                                      ['group', '=', $group],
                                      ['sign', '=', $sign]
                                  ])
                          ->field("value")
                          ->find();
            if ( !empty($config) && !empty($config->value) ) {
                $value = $config->value;
                redisCacheSet("config:{$group}_{$sign}", $config->value);
            }
        } else {
            $value = $config;
        }
        return $value;
    }


    /**
     * @param string $group
     * @param string $sign
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public static function del_config(string $group, string $sign)
    {
        $config = self::where([
                                  ['group', '=', $group],
                                  ['sign', '=', $sign]
                              ])->find();
        if ( !empty($config) ) {
            $config->delete();
            redisCacheDel("config:{$group}_{$sign}");
        }
        return true;
    }


    /**
     * @param string $group
     * @param string $sign
     * @param $value
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public static function set_config(string $group, string $sign, $value, array $config = [])
    {
        $config = self::where([
                                  ['group', '=', $group],
                                  ['sign', '=', $sign]
                              ])->find();
        if ( empty($config) ) {
            $insertData = [
                'name'  => "{$group}_{$sign}",
                'group' => $group,
                'sign'  => "$sign",
                'value' => $value
            ];
            if ( isset($config['type']) && !empty($config['type']) ) {
                $insertData['type'] = $config['type'];
            }
            if ( isset($config['disabled']) && !is_null($config['disabled']) ) {
                $insertData['disabled'] = $config['disabled'];
            }
            if ( isset($config['weigh']) && !empty($config['weigh']) ) {
                $insertData['weigh'] = $config['weigh'];
            }
            if ( isset($config['remark']) && !empty($config['remark']) ) {
                $insertData['remark'] = $config['remark'];
            }
            $bool = self::create($insertData);
            if ( empty($bool) ) {
                return false;
            }
        } else {
            $config->save([
                              'value' => $value
                          ]);
        }
        redisCacheSet("config:{$group}_{$sign}", $value);
        return true;
    }

}
