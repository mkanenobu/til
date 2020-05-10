let f n =
  let rec iter counter = if counter = n then counter else iter (counter + 1) in
  iter 0
;;

let () = Printf.printf "%d\n" @@ f 10
