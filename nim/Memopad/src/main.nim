import sequtils,strutils,times,os
let args:seq[string] = commandLineParams()

proc list_tasks() {.discardable.} =
    var list_file:File = open("./list.txt",FileMode.fmRead)
    defer: close(list_file)
    while list_file.endOfFile == false:
        echo readLine(list_file)

proc add_tasks() {.discardable.} =
    var list_file:File = open("./list.txt",FileMode.fmAppend)
    defer: close(list_file)
    for task in args[1..<len(args)]:
        list_file.writeLine(task)

proc remove_task() {.discardable.} =
    for task in args[1..<len(args)]:
        var list_file:File = open("./list.txt",FileMode.fmRead)
        defer: close(list_file)
        list_file.writeLine(list_file.readLine.replace(task,""))

proc done() {.discardable.} =
    discard

proc clear() =
    var list_file:File = open("./list.txt",FileMode.fmWrite)
    defer: close(list_file)
if len(args) == 0:
    echo "See --help"
else:
    case args[0]
    of "list": list_tasks()
    of "add": add_tasks()
    of "done": done()
    of "remove": remove_task()
    of "clear": clear()
    of "help":
        echo """
        list      List all TODOs
        add       Add new TODO
        done    
        remove
        clear     Clear all TODOs
        --help    Display this help
        """
    else: echo "See --help"
