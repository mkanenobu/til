#!/bin/bash
sample(){
    echo "${@:3}"
    echo "${!#}"
}
sample 1 2 3 4 5 6 7

