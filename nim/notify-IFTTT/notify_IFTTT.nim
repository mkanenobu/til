import osproc, streams, times

proc dateFormat(d:DateTime):string = format(d, "mm:ss")

var p:Process = startProcess("/bin/ping", "", @["-c", "3", "google.com"])
echo p.processID
