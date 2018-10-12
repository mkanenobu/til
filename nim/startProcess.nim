import osproc,streams,times
proc `$`(t:DateTime):string = format(t, "yyyy/MM/dd HH:mm:ss ")
#block:
#var p:Process
#defer:
#    p.close
var p = startProcess("/bin/ping", "", @["-c","5","127.0.0.1"])
echo p.processID
let outstr = p.outputStream
var line:string = ""
while outstr.readLine(line):
    let now:DateTime = getTime().local
    echo now, line
echo p.waitForExit()

