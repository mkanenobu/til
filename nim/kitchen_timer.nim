import strutils, os

let input_time_minute: int = (commandLineParams())[0].parseInt

proc timer() =
    for remain_time in countdown(input_time_minute, 0):
        if remain_time == 0:
            echo "Times up!"
            break
        echo remain_time, " minutes remain"
        sleep 60 * 1000


timer()
