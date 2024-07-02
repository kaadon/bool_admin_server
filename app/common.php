<?php
/*
 * @Autor: zs
 * @Date: 2021-05-26 09:12:32
 * @LastEditors: zs
 * @LastEditTime: 2021-05-26 16:03:50
 */

// 应用公共文件

use commons\models\system\SystemConfig;
use Symfony\Component\VarExporter\VarExporter;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\exception\HttpResponseException;
use think\Response;
use think\response\Json;

if (!function_exists('lineToHump')) {

    /**
     * 下划线转驼峰
     * @param $str
     * @return null|string|string[]
     */
    function lineToHump($str)
    {
        $str = preg_replace_callback('/([-_]+([a-z]{1}))/i', function ($matches) {
            return strtoupper($matches[2]);
        }, $str);
        return $str;
    }
}
if (!function_exists('humpToLine')) {

    /**
     * 驼峰转下划线
     * @param $str
     * @return null|string|string[]
     */
    function humpToLine($str)
    {
        $str = preg_replace_callback('/([A-Z]{1})/', function ($matches) {
            return '_' . strtolower($matches[0]);
        }, $str);
        return $str;
    }
}
if (!function_exists('getRealIP')) {
    /**
     * 获取真实ip
     */
    function getRealIP()
    {
        $forwarded = request()->header("x-forwarded-for");
        if ($forwarded) {
            $ip = explode(',', $forwarded)[0];
        } else {
            $ip = request()->ip();
        }
        return $ip;
    }
}
if (!function_exists('parseNodeStr')) {
    function parseNodeStr($node)
    {
        $array = explode('/', $node);
        foreach ($array as $key => $val) {
            if ($key == 0) {
                $val = explode('.', $val);
                foreach ($val as &$vo) {
                    $vo = humpToLine(lcfirst($vo));
                }
                $val = implode('.', $val);
                $array[$key] = $val;
            }
        }
        $node = implode('/', $array);
        return $node;
    }
}
if (!function_exists('parse_lower')) {

    /**
     * 控制器首字母边小写
     */
    function parse_lower($controller)
    {

        $val = explode('.', $controller);
        if (is_array($val)) {
            foreach ($val as &$vo) {
                $vo = humpToLine(lcfirst($vo));
            }
            $controller = implode('.', $val);
        }
        return $controller;
    }
}
if (!function_exists('__url')) {

    /**
     * 构建URL地址
     * @param string $url
     * @param array $vars
     * @param bool $suffix
     * @param bool $domain
     * @return string
     */
    function __url(string $url = '', array $vars = [], $suffix = true, $domain = false)
    {
        return url($url, $vars, $suffix, $domain)->build();
    }
}
if (!function_exists('sysconfig')) {

    /**
     * 获取系统配置信息
     * @param $group
     * @param null $name
     * @return array|mixed
     */
    function sysconfig($group, $name = null): mixed
    {
        $where = ['group' => $group];
        if (empty($value)) {
            if (!empty($name)) {
                $where['name'] = $name;
                $value = (new SystemConfig())->where($where)->value('value');
            } else {
                $value = (new SystemConfig())->where($where)->column('value', 'name');
            }
        }
        return $value;
    }
}
/** REQUEST **/
if (!function_exists('api_post')) {

    /**
     * api发起POST请求
     * @param string $func [请求api方法]
     * @param array|string $data [请求api数据]
     */
    function api_post(string $func, array|string $data = [], $header = [])
    {
        $url = config('app.api') . $func;
        $output = curl($url, $data, $header);
        return json_decode($output, true);
    }
}
if (!function_exists('curl')) {

    /**
     * CURL请求函数:支持POST及基本header头信息定义
     * @param string $api_url [请求远程链接]
     * @param array|string|null $post_data [请求远程数据]
     * @param array|null $header [头信息数组]
     * @return array|bool|string
     */
    function curl(string $api_url, array|string|null $post_data, ?array $header): bool|array|string
    {
        /**初始化CURL句柄**/
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $api_url);
        /**配置返回信息**/
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); //获取的信息以文件流的形式返回，不直接输出
        curl_setopt($ch, CURLOPT_HEADER, 0);         //不返回header部分
        /**配置超时**/
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10); //连接前等待时间,0不等待
        curl_setopt($ch, CURLOPT_TIMEOUT, 60);        //连接后等待时间,0不等待。如下载mp3
        /**配置页面重定向**/
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1); //跟踪爬取重定向页面
        curl_setopt($ch, CURLOPT_MAXREDIRS, 10);     //指定最多的HTTP重定向的数量
        curl_setopt($ch, CURLOPT_AUTOREFERER, 1);    // 自动设置Referer
        /**配置Header、请求头、协议信息**/
        $header[] = "CLIENT-IP:" . request()->ip();
        $header[] = "X-FORWARDED-FOR:" . request()->ip();
        curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
        curl_setopt($ch, CURLOPT_ENCODING, "");                 //Accept-Encoding编码，支持"identity"/"deflate"/"gzip",空支持所有编码
        curl_setopt($ch, CURLOPT_USERAGENT, "Mozilla/5.0 (compatible; Baiduspider/2.0; +" . request()->domain() . request()->domain() . ")");
        //模拟浏览器头信息
        curl_setopt($ch, CURLOPT_REFERER, request()->domain()); //伪造来源地址
        /**配置POST请求**/
        if ($post_data && is_array($post_data)) {
            curl_setopt($ch, CURLOPT_POST, 1); //支持post提交数据
            curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($post_data));
        }
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); //禁止 cURL 验证对等证书
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false); //是否检测服务器的域名与证书上的是否一致
        $data = curl_exec($ch);
        if (curl_errno($ch)) {
            // 捕抓异常
            return ['status' => 'error', 'message' => curl_error($ch)];
        } else {
            // 正常返回
            curl_close($ch);
            return $data;
        }
    }
}
/** CONFIG **/
if (!function_exists('get_config')) {

    /**
     * 获取系统配置信息
     * @param string $group
     * @param string $name
     * @return array|mixed
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException|RedisException
     */
    function get_config(string $group, string $name): mixed
    {
        return SystemConfig::get_config($group, $name);
    }
}
if (!function_exists('get_config_group')) {
    /**
     * 获取缓存组
     * @param string $group
     * @return array|null
     * @throws Exception
     */
    function get_config_group(string $group): ?array
    {
        try {
            return SystemConfig::get_config_group($group);
        } catch (RedisException $e) {
            throw new \Exception($e->getMessage());
        }
    }
}
if (!function_exists('del_config')) {
    /**
     * 删除配置缓存
     * @param string $group
     * @param string $name
     * @return mixed|string
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException|RedisException
     */
    function del_config(string $group, string $name): mixed
    {
        return SystemConfig::del_config($group, $name);
    }
}
if (!function_exists('set_config')) {
    /**
     * 设置缓存
     * @param string $group
     * @param string $name
     * @param string|int $value
     * @param array|null $options
     * @return bool
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    function set_config(string $group, string $name, string|int $value, ?array $options): bool
    {
        return SystemConfig::set_config($group, $name, $value, $options);
    }
}

/** addons_config **/
if (!function_exists('get_addons_all_config')) {
    /**
     * 获取插件所有的配置
     */
    function get_addons_all_config($name)
    {
        $addon = get_addons_instance($name);
        if (!$addon) {
            return [];
        }
        $config = $addon->getConfig(true);
        return $config;
    }
}
if (!function_exists('get_addons_config_format')) {
    /**
     * 获取插件配置 数组格式
     */
    function get_addons_config_format($name): array
    {
        $config_format = [];
        $config = get_addons_all_config($name);
        foreach ($config as $v) {
            $config_format[$v['name']] = $v['value'];
        }
        return $config_format;
    }
}
if (!function_exists('set_addons_config')) {
    /**
     * 设置插件配置
     */
    function set_addons_config($name, $config): bool
    {
        $file = get_back_addons_path() . DIRECTORY_SEPARATOR . $name . DIRECTORY_SEPARATOR . "config.php";
        if (!is_file($file)) {
            throw new \Exception("配置文件不存在");
        }
        if (!is_writable($file)) {
            throw new \Exception("配置文件无法写入");
        }
        $res = file_put_contents($file, "<?php\n\n" . "return " . VarExporter::export($config) . ";\n", LOCK_EX);
        if (!$res) {
            throw new \Exception("配置修改失败");
        }
        return true;
    }
}
if (!function_exists('get_back_addons_path')) {
    /**
     * 返回后台跟目录
     */
    function get_back_addons_path(): string
    {
        $back_addons_path = root_path() . "addons";
        // 如果插件目录不存在则创建
        if (!is_dir($back_addons_path)) {
            @mkdir($back_addons_path, 0755, true);
        }
        return $back_addons_path;
    }
}

/**
 * @description: 其他状态
 * @param int $code
 * @param string $msg
 * @param array $data
 * @return Json {*}
 */
function result(int $code = 0, string $msg = '', array $data = []): Json
{
    $data = [
        'code' => $code,
        'msg' => $msg,
        'time' => time(),
        'data' => $data,
    ];
    return json($data);
}

function addonresult($code = 0, $msg = '', $data = [], $type = 'json', array $header = [])
{
    $result = [
        'code' => $code,
        'msg' => $msg,
        'time' => time(),
        'data' => $data,
    ];
    $response = Response::create($result, $type)->header($header);
    throw new HttpResponseException($response);
}
