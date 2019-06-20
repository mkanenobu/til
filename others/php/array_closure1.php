<?php
// 配列系のクロージャ
$var = [
    ['id' => 25, 'name' => 'ピカチュウ'],
    ['id' => 26, 'name' => 'ライチュウ'],
    ['id' => 27, 'name' => 'サンド'],
];

// 普通のmap, nameだけ取り出し
$var = (array_map(function($var) {
    return $var['name'];
}, $var));
var_dump($var);


// 複数の配列の同じインデックスの要素それぞれを引数に取り、それらの要素を用いて値を返すクロージャ
$firstNames = ['穂乃果', 'ことり', '海未'];
$lastNames = ['高坂', '南', '園田'];
$fullName = array_map(function($lastName, $firstName) {
    return "$lastName $firstName";
}, $lastNames, $firstNames);
var_dump($fullName);


// 配列の各要素を順番にクロージャに適用し、適用結果を返す
// ((((1 * 100) * 2) * 3) * 4)
$nums = [1, 2, 3, 4];
$prod = array_reduce($nums, function($c, $num) {
  return $c * $num;
}, 100);
var_dump($prod);

// 応用例として、多重配列の平坦化の実装。
function array_flatten(array $a) {
    return array_reduce($a, function($c, $v) {
        return array_merge($c, $v);
    },[] );
}
var_dump(array_flatten([[1,2,3], [4,5,6], [1,2]]));
