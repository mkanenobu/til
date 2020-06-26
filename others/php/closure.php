<?php
$lambda = function($name) {
  echo "Hello, ${name}";
};
$lambda("John");

// Arrow function(PHP 7.4~)
$add = fn($x, $y) => $x + $y;
echo $add(1, 3);
