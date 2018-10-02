#!/bin/bash
if [ -z "$(sed -e "s/erase//g" -e "s/dreamer//g" -e "s/dream//g" -e "s/erase//g" -e "s/ase//g")" ]; then
    echo YES
else
    echo NO
fi
