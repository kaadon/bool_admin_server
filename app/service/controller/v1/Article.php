<?php
/**
 *   +----------------------------------------------------------------------
 *   | PROJECT:   [ bool_admin_server ]
 *   +----------------------------------------------------------------------
 *   | 官方网站:   [ https://developer.kaadon.com ]
 *   +----------------------------------------------------------------------
 *   | Author:    [ kaadon.com <kaadon.com@gmail.com>]
 *   +----------------------------------------------------------------------
 *   | Tool:      [ PhpStorm ]
 *   +----------------------------------------------------------------------
 *   | Date:      [ 2024/8/7 ]
 *   +----------------------------------------------------------------------
 *   | 版权所有    [ 2020~2024 kaadon.com ]
 *   +----------------------------------------------------------------------
 **/

namespace app\service\controller\v1;

use app\service\ServiceBaseV1;
use app\service\ServiceException;
use Exception;
use resources\enum\ArticleCateEnum;
use resources\model\article\Articles;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\response\Json;

class Article extends ServiceBaseV1
{
    public function index():Json
    {
        return success();
    }

    /**
     * 获取文章列表
     * @return Json
     * @throws \app\service\ServiceException
     */
    public function getArticleList(): Json
    {
        try {
            //逻辑代码
            $post = $this->request->post();
            $post['cate'] = isset($post['cate']) ? ArticleCateEnum::tryFrom((int)$post['cate']) : null;
            if (!$post['cate']) throw new Exception('不支持文章类型');
            return paginate((new Articles)->where([
                'status' => 1,
                'cate' => $post['cate']->value
            ])->order('id desc')->paginate());
        } catch (Exception $exception) {
            throw new ServiceException($exception->getMessage()); ;
        }
    }

    /**
     * 获取文章详情
     * @return Json
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @throws Exception
     */
    public function getArticleDetail(): Json
    {
        $article_id = $this->request->post('article_id/d', null);
        if (empty($article_id)) throw new ServiceException('文章ID不能为空');
        $ArticleList = (new Articles)->find($article_id);
        return success($ArticleList);
    }

    /**
     * 获取文章类别
     * @return Json
     */
    public function getArticleCateList(): Json
    {
        return success(Articles::getArticleCates());
    }

}