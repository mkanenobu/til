#!/bin/bash
case $# in
	1 ) cat >> $1 ;;
	2 ) cat $1 >> $2 ;;
	* ) echo "Usage: append [fromfile] tofile" 1>&2 ;;
esac
