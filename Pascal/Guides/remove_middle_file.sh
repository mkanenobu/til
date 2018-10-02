#!/bin/sh

### remove middle file and executable file

rm ./*.o >/dev/null 2>&1
find . -perm 775 -not -name '*.sh' -delete
