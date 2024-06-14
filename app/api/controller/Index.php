<?php
declare (strict_types = 1);

namespace app\api\controller;

use commons\logic\member\MemberLogic;
use commons\models\member\enum\AccountCateEnum;
use commons\models\service\enum\UuidEnum;
use commons\models\service\ServiceUuids;

class Index
{
    public function index()
    {
        MemberLogic::AddMember(AccountCateEnum::email, 'kaadon@kaadon.com', '123456', '');
        return '您好！这是一个[api]示例应用';
    }
}