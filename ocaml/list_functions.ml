open Printf;;

let l = [5; 4; 3; 2; 1];;

let () =
  printf "%d\n" @@ List.hd l;
  List.iter (printf "%d ") @@ List.tl l;
  print_endline "";

  (* iter with index *)
  List.iteri (
    fun i e ->
      printf "index: %d, element: %d\n" i e;
  ) l
