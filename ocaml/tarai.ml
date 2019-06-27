let count = ref 0
let rec tarai (x, y, z) =
  count := !count + 1;
  Printf.printf "%d times (%d %d %d)\n" !count x y z;
  if x <= y then y
  else tarai ((tarai ((x - 1), y, z)), (tarai ((y - 1), z, x)), (tarai ((z - 1), x, y)))
;;

let () =
  Printf.printf "%d\n" @@ tarai (12, 6, 0);

