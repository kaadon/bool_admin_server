<?php

namespace resources\model\system;


use Exception;
use Kaadon\ThinkBase\BaseClass\BaseModel;
use Kaadon\ThinkBase\traits\ModelTrait;
use RedisException;
use resources\enum\ConfigGroupEnum;
use resources\enum\ConfigTypeEnum;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;


class SystemConfig extends BaseModel
{
    use ModelTrait;
    /**
     * @throws Exception
     */
    public static function clearCache($model): void
    {
        try {
            //逻辑代码
            if (isset($model->group)) redisCacheDel("config:groups:{$model->group}s");
            if (isset($model->sign) && isset($model->group)) redisCacheDel("config:{$model->group}_{$model->sign}");
        } catch (Exception $exception) {
            throw new Exception($exception->getMessage());
        }
    }

    public function getGroupList(): array
    {
        return array_map(function ($item) {
            return ['label' => $item->label(), 'value' => $item->value];
        }, ConfigGroupEnum::cases());
    }

    /**
     * @param string $group
     * @return array|mixed|string
     * @throws Exception
     */
    public static function get_config_group(string $group): mixed
    {
        $configs = redisCacheGet("config:groups:{$group}s");
        if (empty($configs)) {
            $where = ['group' => $group];
            $value = (new self())->where($where)->column('value', 'name');
            if (!empty($value)) {
                redisCacheSet("config:groups:{$group}s", $value);
            }
        } else {
            $value = $configs;
        }
        return $value;
    }

    /**
     * @param string $group
     * @param string $sign
     * @return mixed|null
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @throws Exception
     */
    public static function get_config(string $group, string $sign): mixed
    {
        $value = null;
        $config = redisCacheGet("config:{$group}_{$sign}");
        if (empty($config)) {
            $config = (new self())->where([
                ['group', '=', $group],
                ['sign', '=', $sign]
            ])
                ->field("value")
                ->find();
            if (!empty($config) && !empty($config->value)) {
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
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException|RedisException
     */
    public static function del_config(string $group, string $sign): bool
    {
        $config = (new self())->where([
            ['group', '=', $group],
            ['sign', '=', $sign]
        ])->find();
        if (!empty($config)) {
            $config->delete();
            redisCacheDel("config:{$group}_{$sign}");
        }
        return true;
    }


    /**
     * @param string $group
     * @param string $sign
     * @param string|int|float|null $value
     * @param array $options
     * @return bool
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public static function set_config(string $group, string $sign, string|int|float|null $value, array $options = []): bool
    {
        $config = (new self())->where([
            ['group', '=', $group],
            ['sign', '=', $sign]
        ])->find();
        if (empty($config)) {
            $insertData = [
                'name' => "{$group}_{$sign}",
                'group' => $group,
                'sign' => "$sign",
                'value' => $value
            ];
            if (isset($options['type'])) {
                $insertData['type'] = $options['type'];
            }
            if (isset($options['title'])) {
                $insertData['title'] = $options['title'];
            }
            if (isset($options['extend'])) {
                $insertData['extend'] = $options['extend'];
            }
            if (isset($options['weigh'])) {
                $insertData['weigh'] = $options['weigh'];
            }
            if (isset($options['remark'])) {
                $insertData['remark'] = $options['remark'];
            }
            $bool = (new self())->save($insertData);
            if (empty($bool)) {
                return false;
            }
        } else {
            $config->save(['value' => $value]);
        }
        return true;
    }

    public function getConfigTypes(): array
    {
        return array_map(function ($case) {
            return [
                'value' => $case->value,
                'label' => $case->label(),
                'extend' => $case->getExtend()
            ];
        }, ConfigTypeEnum::cases());
    }

}
