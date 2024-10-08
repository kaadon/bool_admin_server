<?php

namespace app\admin\controller\system;

use app\admin\model\system\SystemGroup;
use app\admin\model\system\SystemGroupAdmin;
use app\admin\validate\SystemAdmin;
use app\admin\AdminBase;
use resources\enum\StatusEnum;
use think\App;
use think\exception\ValidateException;
use think\facade\Db;
use think\facade\Log;
use think\response\Json;
use util\Token;

/**
 * 系统管理员控制器
 */
class Admin extends AdminBase
{
    public function __construct(App $app)
    {
        parent::__construct($app);

        $this->model = new \app\admin\model\system\SystemAdmin();
        $this->prefix = env('database.prefix');
    }

    /**
     * 列表
     */
    public function index(): Json
    {
       
        $token=$this->request->header("token");
        
        list($limit, $where, $sortArr) = $this->buildTableParames();
        $is_superadmin=Token::is_superadmin($token);
        if(!$is_superadmin){
            $adminId=Token::userId($token);
            $where[]=['admin_id','=',$adminId];
        }
        $list = $this->model
            ->where($where)
            ->order($sortArr)
            ->paginate($limit);
        $systemGroups = SystemGroup::where('status', 1)->column('id,name');
        $groupName = [];
        foreach ($systemGroups as $k => $v) {
            $groupName[$v['id']] = $v['name'];
        }
        foreach ($list as $k => $v) {
            $group_arr = Db::table("{$this->prefix}system_group_admin")
                ->alias('sga')
                ->field('sg.name')
                ->leftJoin("{$this->prefix}system_group sg", 'sga.group_id=sg.id')
                ->where('sga.admin_id', $v['id'])
                ->select();

            $group_text = "";
            $i = 0;
            foreach ($group_arr as $key => $val) {
                $group_text = $i == 0 ? $val['name'] : $group_text . "," . $val['name'];
                $i++;
            }
            $v['group_text'] = $group_text;
            unset($v['password']);
        }
        $data = [
            'code' => 200,
            'msg' => '',
            'count' => $list->total(),
            'data' => $list->items(),
        ];
        return json($data);
    }
    /**
     * 添加
     */
    public function add(): Json
    {
        $token=$this->request->header("token");
        $adminId=Token::userId($token);
        $post = $this->request->post();
        Db::startTrans();
        try {
            validate(SystemAdmin::class)->check($post);
            $post['password'] = md5($post['password']);
            $post['admin_id']=$adminId;
            $this->model->save($post);
            $row = $this->model->where('username', $post['username'])->find();
            // $group_ids=explode(',',$post['group_ids']);
            $group_ids = $post['group_ids'];
            $groupadmin = [];
            foreach ($group_ids as $v) {
                $groupadmin[] = ['admin_id' => $row['id'], 'group_id' => $v];
            }
            $groupadminModel = new SystemGroupAdmin();
            $groupadminModel->saveAll($groupadmin);
            Db::commit();
            return successes('添加成功！');
        } catch (ValidateException $e) {
            return error($e->getError());

        } catch (\Exception $e) {
            Db::rollback();
            Log::error("--------:" . $e);
            return error('添加失败:' . $e->getMessage());
        }

    }

    /**
     * 查找
     */
    public function find(): Json
    {
        $id= $this->request->param('id');
        $row = $this->model->where("id",$id)->find();
        if (empty($row)) {
            return error("数据不存在");
        }
        $groups = SystemGroupAdmin::where('admin_id', $row['id'])->column('group_id');
        $row['group_ids'] = $groups;
        return successes('ok', $row);
    }

    /**
     * 修改
     *
     */
    public function edit(): Json
    {
        $id= input('id');
        $row = $this->model->find($id);
        if (empty($row)) {
            return error('数据不存在');
        }

        $post = $this->request->post();
        Db::startTrans();
        try {
            validate(SystemAdmin::class)->scene('edit')->check($post);
            if (isset($post['password']) && $post['password'] != "") {
                $post['password'] = md5($post['password']);
            } else {
                unset($post['password']);
            }
            $row->save($post);
            $groupadminModel = new SystemGroupAdmin();
            $groupadminModel->where('admin_id', $row['id'])->delete();
            //$group_ids=explode(',',$post['group_ids']);
            $group_ids = $post['group_ids'];
            $groupadmin = [];
            foreach ($group_ids as $v) {
                $groupadmin[] = ['admin_id' => $row['id'], 'group_id' => $v];
            }
            $groupadminModel->saveAll($groupadmin);
            Db::commit();
            return successes('添加成功！');
        } catch (ValidateException $e) {
            return error($e->getError());
        } catch (\Exception $e) {
            Db::rollback();
            Log::error("--------:" . $e);
            return error('保存失败',201,["message"=>$e->getMessage(),"trace"=>$e->getTrace()]);
        }
    }

    /**
     * 数据删除
     */
    public function delete(): Json
    {

        $id= $this->request->post('id');
        $ids = is_array($id) ? $id : explode(',', $id);
        $row = $this->model->where("id", "in", $ids)->select();
        if ($row->isEmpty()) {
            return error('数据不存在');
        }
        if (in_array("1", $ids) || in_array(1, $ids)) {
            return error('当前管理员不可以删除!');
        }
        try {
            $save = $row->delete();
            SystemGroupAdmin::where('admin_id', 'in', $ids)->delete();
        } catch (\Exception $e) {
            return error('删除失败');
        }
        return $save ? successes('删除成功！') : error('删除失败');

    }

    /**
     * 状态启用、禁用
     */
    public function status(): Json
    {
        try {
            $id = $this->request->param('id');
            if ((int)$id === 1) return error('超级管理员不可操作');
            $status = $this->request->param('status') ? StatusEnum::tryFrom($this->request->param('status')) : null;
            if (empty($status)) return error('状态错误');
            $row = $this->model->find($id);
            if (empty($row)) return error('数据不存在');
            $row->status = $status->value;
            $row->save();
            return successes("修改状态成功:{$status->label()}");
        } catch (\Exception $e) {
            return error("修改状态失败");
        }
    }

}
