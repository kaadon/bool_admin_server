<?php /** @noinspection ALL */

namespace Kaadon\KaadonBase\services;

use think\facade\Env;

/**
 *
 */
class redisService
{
    /**
     * @var int|mixed
     */
    public $select   = 2;
    /**
     * @var mixed|string
     */
    public $host     = "127.0.0.1";
    /**
     * @var int|mixed
     */
    public $port     = 6379;
    /**
     * @var mixed|string
     */
    public $password = "123456";

    /**
     * @param string|null $host
     * @param int|null $port
     * @param int $select
     * @param string|null $password
     */
    public function __construct(?string $host = null, ?int $port = null, int $select = 0, ?string $password = null)
    {
        if (!is_null($host)) {
            $this->host = Env::get('redis.hostname', "127.0.0.1");
        }
        if (!is_null($port)) {
            $this->port = Env::get('redis.port', 6379);
        }
        if (!is_null($select)) {
            $this->select = Env::get('redis.select', 0);
        }
        if (!is_null($password)) {
            $this->password = Env::get('redis.password', "");
        }
        return $this->redisClient($this->select);
    }

    /**
     * @param $select
     * @return \Redis
     */
    public function redisClient(?int $select = null)
    {
        $redis = new \Redis();
        $redis->connect($this->host, $this->port);
        $redis->auth($this->password);
        $redis->select($this->select);
        return $redis;
    }
}