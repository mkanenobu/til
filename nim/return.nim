import strutils, os

for i in 0..100:
  stdout.write i
  sleep 100
  stdout.write("\r")
