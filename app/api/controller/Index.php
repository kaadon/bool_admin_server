<?php
declare (strict_types = 1);

namespace app\api\controller;

use commons\logic\member\MemberLogic;
use commons\logic\merchant\MerchantLogic;
use commons\models\member\enum\MemberAccountCateEnum;
use commons\models\merchant\enum\MerchantAccountCateEnum;
use commons\models\service\enum\UuidEnum;
use commons\models\service\ServiceUuids;

class Index
{
    public function index()
    {
//        MemberLogic::AddMember(MemberAccountCateEnum::email, 'kaadon@kaadon.com', '123456', '',true);
        var_dump(MemberAccountCateEnum::cases());
        return '您好！这是一个[api]示例应用';
    }
}