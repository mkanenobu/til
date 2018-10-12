import os,osproc
var
    #file_path:string = execProcess("pwd")
    file_path:string = "/usr/share/nano/asm.nanorc"
    (dir,name,ext) = splitFile(file_path)
echo dir
echo name
echo ext
