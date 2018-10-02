#!/bin/bash
while getopts :bf: OPT; do
    case $OPT in
        b) el="OK";;
        f) forward="$OPTARG" ;;
    esac
done
if [ "$el" == OK ] ;then
    echo "opt is b"
fi
echo "$@"
echo "$el"
echo "$forward"
