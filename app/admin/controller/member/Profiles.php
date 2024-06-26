<?php
/**
 *   +----------------------------------------------------------------------
 *   | PROJECT:   [ bool_admin_server ]
 *   +----------------------------------------------------------------------
 *   | 官方网站:   [ https://developer.kaadon.com ]
 *   +----------------------------------------------------------------------
 *   | Author:    [ kaadon <kaadon.com@gmail.com> codemiracle]
 *   +----------------------------------------------------------------------
 *   | Tool:      [ PhpStorm ]
 *   +----------------------------------------------------------------------
 *   | Date:      [ 2024/6/19 ]
 *   +----------------------------------------------------------------------
 *   | 版权所有    [ 2020~2024 kaadon.com ]
 *   +----------------------------------------------------------------------
 **/

namespace app\admin\controller\member;

use app\admin\AdminBase;
use commons\logic\member\MemberLogic;
use commons\models\member\enum\MemberAccountCateEnum;
use commons\models\member\MemberProfiles;
use think\App;
use think\exception\ValidateException;
use think\response\Json;

class Profiles extends AdminBase
{
    protected bool $relationSearch = true;

    public function __construct(App $app)
    {
        parent::__construct($app);
        $this->model = new MemberProfiles();
        $this->validate = [];
    }

    /**
     * 列表
     */
    public function index(): Json
    {
        try {
            //逻辑代码
            list($limit, $where, $sortArr) = $this->buildTableParames();
            $list = $this->model
                ->withJoin('account')
                ->where($where)
                ->order($sortArr)
                ->paginate($limit);
            return paginate($list);
        } catch (\Exception $exception) {
            return error($exception->getMessage());
        }
    }

    public function add(): Json
    {
        $post = $this->request->post();
        try {
            $this->validate && validate($this->validate)->check($post);
            $cate = MemberAccountCateEnum::tryFrom((int)$post['cate']);
            if (empty($cate)) throw new \Exception('注册类型不存在...');
            $result = MemberLogic::AddMember(MemberAccountCateEnum::system, $post['username'], $post['password'], $post['inviter'], true, [MemberAccountCateEnum::from($post['cate'])->name => $post['username']]);
            if ($result) {
                return successes('添加成功！');
            }
            return error('添加失败');
        } catch (ValidateException $e) {
            return error($e->getError());
        } catch (\Exception $e) {
            return error('添加失败:' . $e->getMessage());
        }
    }

    public function getOptions(): Json
    {
        return successes('', [
            "cates" => MemberProfiles::getCates(),
            "levels" => MemberProfiles::getLevels()
        ]);
    }

    public function getInviter(): Json
    {
        return successes('', MemberLogic::getInviter($this->request->param('inviter/s', "")));
    }

    public function delete(): Json
    {
        return error('站不支持删除炒作');
    }

}