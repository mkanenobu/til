#!/bin/bash

# typeはPOSIX準拠では無い
if type "git" >/dev/null 2>&1 ;then
    echo "Git exists"
else
    echo "Git not exists"
fi

# POSIX準拠で書いた場合
if hash "rg" >/dev/null 2>&1 ;then
    echo "Ripgrep exists"
else
    echo "Ripgrep not exists"
fi
