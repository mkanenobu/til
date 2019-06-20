<?php
// usort系
$var = [
    ['id' => 26, 'name' => 'ライチュウ'],
    ['id' => 27, 'name' => 'サンド'],
    ['id' => 25, 'name' => 'ピカチュウ'],
];
// idでソート
usort($var, function($a, $b) {
    return $a['id'] - $b['id'];
});
var_dump($var);

// よくあるfilter, 配列の添字はそのまま
// 偶数以外をフィルタリング
$nums = [1, 2, 3, 4, 5, 6];
$filtered = array_filter($nums, function($v) {
    return $v % 2 === 0;
});
var_dump($filtered);
