#!/bin/bash
n1=0
n2=1
echo -n "$n1"", "
for i in `seq 50`;do
    if test "$n2" -gt 100000; then
        echo "Over 100000"
        break
    fi
    echo -n "$n2"
    n3=$((n1+n2))            #faster
#    n3=`expr "$n1" + "$n2" ` #slower
    n1=$n2
    n2=$n3
    echo -n ", "
done
