<?php
declare(strict_types=1);
if (!function_exists('line_array')) {


    /**
     * @param string $str 待分割字符串
     * @param string $separator 分割字符串
     * @param bool $reverse 是否反序
     * @return array
     */
    function line_array(string $str, string $separator = ',', bool $reverse = false): array
    {
        try {
            $strArray = explode($separator, $str);
            foreach ($strArray as $key => $item) {
                if (empty($item)) {
                    unset($strArray[$key]);
                }
            }
            if ($reverse) {
                $strArray = array_reverse($strArray);
            }
        } catch (\Exception $exception) {
            return [];
        }
        return $strArray;
    }
}