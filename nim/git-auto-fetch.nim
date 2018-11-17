#################################################
# Automatically excute 'git fetch' at intervals #
#################################################

import os, osproc, ospaths, strformat

const interval = 3600  # second

let
  (gitRoot, exitCode) = execCmdEx("git rev-parse --show-toplevel")
if exitCode != 0:
  quit 0

let
  cacheDir = getHomeDir() & ".cache/"
  cacheFilePath = cacheDir & "git-autofetch"
  tmpFilePath = cacheDir & "git-autofetch.tmp"
  currentTime = epochTime()

var
  cacheFile, tmpFile: File
  cachedGitRoot, cacheTime: string

if not existsFile(cacheFilePath):
  var cacheFile: File = open(cacheFilePath, FileMode.fmWrite)
  defer: close(cacheFile)
  cacheFile.writeLine(fmt"{currentTime},{gitRoot}")
else:
  cacheFile = open(cacheFilePath, FileMode.fmRead)
  tmpFile = open(tmpFilePath, FileMode.fmWrite)
  defer: close(cacheFile)
  for i in lines(cacheFile):
    if i.split(',')[1] == gitRoot:
      if currentTime - parseInt(i.split(',')[0]) >= interval:
        execProcess("git fetch")
    else:

