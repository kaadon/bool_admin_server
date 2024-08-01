<?php
/**
 *   +----------------------------------------------------------------------
 *   | PROJECT:   [ machine01_server ]
 *   +----------------------------------------------------------------------
 *   | 官方网站:   [ https://developer.kaadon.com ]
 *   +----------------------------------------------------------------------
 *   | Author:    [ kaadon.com <kaadon.com@gmail.com>]
 *   +----------------------------------------------------------------------
 *   | Tool:      [ PhpStorm ]
 *   +----------------------------------------------------------------------
 *   | Date:      [ 2024/7/4 ]
 *   +----------------------------------------------------------------------
 *   | 版权所有    [ 2020~2024 kaadon.com ]
 *   +----------------------------------------------------------------------
 **/

namespace resources\model\article;

use resources\enum\ArticleCateEnum;
use Kaadon\ThinkBase\BaseClass\BaseModel;

/**
 * Class Articles
 * @mixin \think\Model
 */
class Articles extends BaseModel
{

    /**
     * @return array
     */
    public static function getArticleCates(): array
    {
        return array_map(function ($cate) {
            return [
                'value' => $cate->value,
                'label' => $cate->getName(),
                'limit' => $cate->getLimit(),
                "options" => $cate->getOptions()
            ];
        }, ArticleCateEnum::cases());
    }
}