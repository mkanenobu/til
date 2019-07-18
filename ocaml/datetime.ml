let t = Unix.localtime @@ Unix.time ()

let (year, month, day, hour, minutes) =
  (t.tm_year, t.tm_mon, t.tm_mday, t.tm_hour, t.tm_min)

let () =
  Printf.printf "Now: %04d-%02d-%02d %02d:%02d\n"
    (1900 + year) (month + 1) day hour minutes
