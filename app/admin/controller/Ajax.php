<?php

// +----------------------------------------------------------------------
// | kaadonadmin框架 [ kaadonadmin框架 ]
// +----------------------------------------------------------------------
// | 版权所有 2020~2024 kaadon.com
// +----------------------------------------------------------------------
// | 官方网站: https://www.quickadmin.icu
// +----------------------------------------------------------------------
// | Author: kaadon <kaadon.com@gmail.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;

use app\admin\listener\Files;
use app\admin\service\MenuService;
use app\admin\AdminBase;
use Kaadon\ThinkBase\utils\Upload;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\facade\Log;
use think\File;
use think\response\Json;

class Ajax extends AdminBase
{
    /**
     * 初始化后台接口地址
     * @return Json
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function initIndex(): Json
    {
        // $cacheData = Cache::get('initIndex_' . $this->adminId);
        // if (!empty($cacheData)) {
        //     return json($cacheData);
        // }
        $menuService = new MenuService($this->adminId);
        $data = [
            'siteConfig' => sysconfig('site'),
            'menuInfo' => $menuService->getMenuTree(),
        ];
        //Cache::tag('initIndex')->set('initIndex_' . $this->adminId, $data);
        return successes('success', $data);
    }
    /**
     * 获取网站配置项
     */
    public function getConfig(): Json
    {
        return successes('success', sysconfig('site'));
    }
    /**
     * 上传文件
     */
    public function upload(): Json
    {
        $file = $this->request->file('file');

        try {
            if (!($file instanceof File)) throw new \Exception('file文件类型不正确,请上传文件');
            $upload_config = [
                'catePath' => $this->request->header('catePath', 'system'),
                'listener' => Files::class,
                'event' => "uploadFile"
            ];
            if ($this->request->header('saveFile', false)) $upload_config['saveFile'] = true;
            $upload = new Upload();
            $res = $upload->upload($file, $upload_config);
            if ($res['url']) {
                return successes('ok', ['url' => $res['url'], 'savePath' => $this->request->header('savepath'),'saveFile'=>$this->request->header('saveFile', false)]);
            } else {
                return error($res['msg']);
            }
        } catch (\Exception $e) {
            return error($e->getMessage(), 201);
        }
    }

    /**
     * 获取验证码
     */

    public function getCaptcha(): Json
    {
        return success(capcha_create() );
    }
}
