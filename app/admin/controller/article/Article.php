<?php

namespace app\admin\controller\article;

use app\admin\AdminBase;
use Articles;
use resources\model\article\enum\ArticleCateEnum;
use Exception;
use think\App;
use think\facade\Db;
use think\Model;
use think\response\Json;
use think\Validate;

/**
 * Article控制器
 */
class Article extends AdminBase
{
    protected ?Model $model = null;

    protected Validate|string|array|null $validate = null;

    protected bool $relationSearch = false;

    public function __construct(App $app)
    {
        parent::__construct($app);

        $this->model = new Articles();

        $this->validate = [];
    }

    public function index(): Json
    {
        try {
            //逻辑代码
            list($limit, $where, $sortArr) = $this->buildTableParames();
            $list = $this->model
                ->where($where)
                ->order($sortArr)
                ->paginate($limit);
            return paginate($list, ['cates' => $this->model->getArticleCates()]);
        } catch (\Exception $exception) {
            return error($exception->getMessage());
        }
    }

    /**
     * 添加
     */
    public function add(): Json
    {
        $post = $this->request->post();
        try {
            $this->validate && validate($this->validate)->check($post);
            if (array_key_exists('cate', $post)) {
                $cate = ArticleCateEnum::tryFrom($post['cate']);
                if (!$cate) return error('添加失败:分类不存在');
                $cateNumber = $cate->getLimit();
                if ($cateNumber != 0 && $this->model->where([
                        'cate' => $post['cate'],
                    ])->count() >= $cateNumber) return error('添加失败:' . $cate->getName() .'分类文章限制为[' . $cateNumber . ']篇');
            } else {
                return error('添加失败:分类不存在');
            }
            $result = $this->model->save($post);
        } catch (Exception $e) {
            return error('添加失败:' . $e->getMessage());
        }
        return successes($result ? '添加成功' : '添加失败', $result);
    }

    /**
     * 修改
     */
    public function edit(): Json
    {
        //逻辑代码
        $id = $this->request->param('id');
        $row = $this->model->find($id);
        if (empty($row)) {
            return error('数据不存在');
        }
        $post = $this->request->post();
        // 启动事务
        Db::startTrans();
        try {
            //逻辑代码
            $this->validate && validate($this->validate)->scene('edit')->check($post);
            if (!array_key_exists('cate', $post)) throw new Exception('添加失败:分类不存在');
            $row->save($post);
            // 提交事务
            Db::commit();
        } catch (\Exception $exception) {
            // 回滚事务
            Db::rollback();
            return error('保存失败:' . $exception->getMessage());
        }
        return success($row);
    }
}
