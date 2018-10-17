<?php
declare(strict_types = 1);

function test(int  $n): string {
    if ($n == 0) {
        return "Hello";
    } elseif ($n == 1) {
        return "World";
    }
}

