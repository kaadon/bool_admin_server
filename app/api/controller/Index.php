<?php
declare (strict_types = 1);

namespace app\api\controller;


use resources\model\member\enum\MemberAccountCateEnum;


class Index
{
    public function index()
    {
//        MemberLogic::AddMember(MemberAccountCateEnum::email, 'kaadon@kaadon.com', '123456', '',true);
        var_dump(MemberAccountCateEnum::cases());
        return '您好！这是一个[api]示例应用';
    }
}