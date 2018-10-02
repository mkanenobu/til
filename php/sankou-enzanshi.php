<?php
$a = false;

// 三項演算子
if ($a == true) {
    $b = "true";
}else{
    $b = "false";
}

// same as

$b = ($a) ? "true" : "false";
echo "b is " . $b . "\n";



// Null合体演算子
// php7以降

if (isset($c)) {
    $d = "true";
}else{
    $d = "false";
}

// same as
// $cが存在しなければ$dに'true'を代入
$d = $c ?? 'true';
echo "d is " . $d . "\n";
