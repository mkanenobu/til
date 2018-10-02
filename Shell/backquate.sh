#!/bin/bash
cd ~/Workspace/Shell
touch test1 test2 test3
find ~/Workspace/Shell -name "test*" \
	| xargs echo
