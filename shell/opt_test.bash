#!/bin/bash
while getopts b:f: OPT; do
    case $OPT in
        b) back="$OPTARG" ;;
        f) forward="$OPTARG" ;;
    esac
done
echo "$OPT"
echo "$back"
