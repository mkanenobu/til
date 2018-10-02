#!/bin/bash
today=`date +%y%m%d`
if test $today -lt 123456; then # Less than
	echo "Less than" 
elif test $today -eq 123456; then # Equal
	echo "Equal"
elif test $today -gt 123456; then # Greater than
	echo "Greater than"
elif test $today -ge 123456; then # Greater or Equal
	echo "Greater or Equal"
elif test $today -le 123456; then # Less or Equal
	echo "Less or Equal"
elif test $today -ne 123456; then # Not equal
	echo "Not equal"
fi
