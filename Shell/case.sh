#!/bin/bash
var="$1"
case "$var" in
    "1" ) echo "var is 1" ;;
    "2" ) echo "var is 2" ;;
    "3" ) echo "var is 3" ;;
    * ) echo "var is not 1 or 2 or 3" ;;
esac

