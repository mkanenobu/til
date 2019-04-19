let t = Unix.localtime (Unix.time ());;
let (day, month, year) = (t.tm_mday, t.tm_mon, t.tm_year);;

let () =
  Printf.printf "The current date is %04d-%02d-%02d\n"
    (1900 + year) (month + 1) day ;;
