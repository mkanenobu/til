#!/bin/bash
num=$1
##if test $num -gt 10 ; then
if [ $num -eq 10 ]; then
	echo 'Num equal 10'
elif [ $num -le 10 ]; then
	echo 'Num is less than 10'
elif [ $num -gt 10 ]; then
	echo 'Num is greater than 10'
fi
