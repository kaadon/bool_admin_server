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
 *   | Date:      [ 2024/7/5 ]
 *   +----------------------------------------------------------------------
 *   | 版权所有    [ 2020~2024 kaadon.com ]
 *   +----------------------------------------------------------------------
 **/

namespace resources\enum;



enum ConfigTypeEnum:string
{
    case INPUT = 'text';

    case TEXTAREA = 'textarea';
    case SWITCH = 'switch';

    case SELECT = 'select';
    case RADIO = 'radio';
    case CHECKBOX = 'checkbox';
    case IMAGE = 'image';
    case MULTI_IMAGE = 'multi_image';
    case FILE = 'file';
    case TIME = 'time';
    case DATE = 'date';
    case DATETIME = 'datetime';
    case TIME_RANGE = 'time_range';
    case DATE_RANGE = 'date_range';
    case DATETIME_RANGE = 'datetime_range';


    public function label(): string
    {
        return match ($this) {
            self::INPUT => '输入型',
            self::TEXTAREA => '文本域',
            self::SWITCH => '开关',
            self::SELECT => '下拉框',
            self::RADIO => '单选框',
            self::CHECKBOX => '复选框',
            self::IMAGE => '图片',
            self::MULTI_IMAGE => '多图',
            self::FILE => '文件',
            self::TIME => '时间',
            self::DATE => '日期',
            self::DATETIME => '日期时间',
            self::TIME_RANGE => '时间范围',
            self::DATE_RANGE => '日期范围',
            self::DATETIME_RANGE => '日期时间范围',

        };
    }


    public function getExtend(): bool
    {
        return match ($this) {
            self::INPUT, self::TEXTAREA, self::SWITCH, self::IMAGE, self::FILE, self::TIME, self::DATE, self::DATETIME, self::TIME_RANGE, self::DATE_RANGE, self::DATETIME_RANGE => false,
            self::SELECT, self::RADIO, self::CHECKBOX, self::MULTI_IMAGE => true,
        };
    }



}
