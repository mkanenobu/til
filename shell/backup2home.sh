#!/bin/bash
if [ -e ~/backups ]; then
	ls ~/ --ignore={Git,Videos,examples.desktop,Templates,Public} | xargs tar -cvf ~/backups/`date +%y%m%d`backup.tar.gz
else
	echo "Not found backup directory"
fi
