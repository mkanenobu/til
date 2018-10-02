#!/bin/bash
if [ -e /media/mika/TRANSCEND/ubuntu_home_backup/ ]; then
	ls ~/ --ignore={Git,Videos,examples.desktop,Templates,Public} | xargs tar -cvf /media/mika/TRANSCEND/ubuntu_home_backup/`date +%y%m%d`backup.tar.gz
else
	echo "Not found backup directory"
fi
