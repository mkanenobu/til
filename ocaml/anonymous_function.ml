let one_arg_function f x =
  f x
;;

let () =
  Printf.printf "%d\n" (one_arg_function (fun n -> n * n) 10);

