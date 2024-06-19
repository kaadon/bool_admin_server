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
 *   | Date:      [ 2024/2/28 ]
 *   +----------------------------------------------------------------------
 *   | 版权所有    [ 2020~2024 kaadon.com ]
 *   +----------------------------------------------------------------------
 **/

namespace commons\models\member\enum;

enum MemberAccountLevelEnum: int
{
    case ORDINARY_MEMBER = 0; //普通会员
    case JUNIOR_MEMBERSHIP = 1; //初级会员
    case INTERMEDIATE_MEMBERSHIP = 2; // 中级会员
    case PREMIUM_MEMBERSHIP = 3; // 高级会员
    case EXCLUSIVE_MEMBERSHIP = 4; // 至尊会员
}

