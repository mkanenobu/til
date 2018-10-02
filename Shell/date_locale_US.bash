#!/bin/bash
locale | grep LC_TIME
LC_TIME="C"
locale | grep LC_TIME
date
