open Printf;;

let print_list l =
  let len = List.length l in
  print_string "[";
  List.iteri (
    fun i e ->
      printf "%d;" e;
      if i = len - 1 then
        printf "]"
      else
        printf " "
  ) l
;;

let l = [5; 4; 3; 2; 1];;

let () =
  printf "%d\n" @@ List.hd l;
  List.iter (printf "%d ") @@ List.tl l;
  print_endline "";

  (* iter with index *)
  List.iteri (
    fun i e ->
      printf "index: %d, element: %d\n" i e;
  ) l;

  (* map *)
  let triple = List.map (fun n -> n * 3) l in
  print_list triple;

  print_endline "";

  (* Handred times other than 2nd element (map with index) *)
  let hundred = List.mapi (
      fun i n ->
        match i with
        | 1 -> n
        | _ -> n * 100
    ) l
  in

  print_list hundred;

