let max_ascii s =
  let n = String.length s in
  let rec iter (max_char, i) =
    if i = n then char_of_int max_char
    else iter (max max_char (int_of_char (String.get s i)), (i + 1))
  in
  iter (0, 0)
;;

let () =
  Printf.printf "%c\n" (max_ascii "string");
