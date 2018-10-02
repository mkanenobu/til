proc writeHelp*() =
    echo("""
    Usage: timer [OPTION] [TIME]
    -s --second    Set time to seconds
    -m --minute    Set time to minutes (Default)
    -h --hour      Set time to hours
    """)
