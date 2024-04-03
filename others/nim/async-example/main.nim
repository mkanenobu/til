import asyncdispatch


proc main() {.async.} =
  try:
    await sleepAsync(1000)
    echo "Slept"

  except:
    echo "Operation Failed"


waitFor main()
