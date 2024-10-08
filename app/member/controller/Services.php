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

namespace app\member\controller;

use app\admin\listener\Files;
use app\member\MemberBase;
use app\member\MemberException;
use Exception;
use Kaadon\ThinkBase\utils\Upload;
use think\File;
use think\response\Json;

/**
 * 服务类 上传文件等
 */
class Services extends MemberBase
{
    /**
     * @return Json
     */
    public function upload(): Json
    {
        $file = $this->request->file('file');
        try {
            if (!($file instanceof File)) throw new MemberException('file文件类型不正确,请上传文件');
            $uploadConfig = [
                'catePath' => $this->request->header('catePath', 'member') ?? "member",
                'listener' => Files::class,
                'event' => "uploadFile"
            ];
            $upload_config['saveFile'] = $this->request->header('saveFile', false);
            $upload = new Upload();
            $res = $upload->upload($file, $upload_config);
            if ($res['url']) {
                return success(['url' => $res['url'], 'savePath' => $this->request->header('savepath'), 'saveFile' => $this->request->header('saveFile', false)]);
            } else {
                return error($res['msg']);
            }
        } catch (Exception $e) {
            return error($e->getMessage());
        }
    }
    /**
     * 获取图片验证码
     * @return Json
     */
    public function getCapcha(): Json
    {
        $verify = capcha_create();
        return success([
            'verify_img_id' => $verify['verify_id'],
            'verify_img_src' => $verify['verify_src']
        ]);
    }
}