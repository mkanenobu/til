import os, osproc, ospaths, strformat, times
import sequtils, strutils

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
  cachedFlg: bool = false

proc main() =
  if not existsFile(cacheFilePath):
    cacheFile = open(cacheFilePath, FileMode.fmWrite)
    defer: close(cacheFile)
    cacheFile.writeLine(fmt"{currentTime},{gitRoot}")
  else:
    cacheFile = open(cacheFilePath, FileMode.fmRead)
    tmpFile = open(tmpFilePath, FileMode.fmWrite)
    defer: close(cacheFile)
    defer: close(tmpFile)

    for i in lines(cacheFile):
      if i.split(",")[1] == gitRoot:
        cachedFlg = true
        if currentTime - parseFloat(i.split(",")[0]) >= interval:
          echo "Exec git fetch"
          discard execProcess("git fetch")
      else:
        tmpFile.writeLine(i)

    if not cachedFlg:
      echo "Exec git fetch and Added to cache"
      tmpFile.writeLine(fmt"{currentTime},{gitRoot}")

    copyFile(tmpFilePath, cacheFilePath)


when isMainModule:
  main()
