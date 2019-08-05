open Core

(** fst: 'a -> 'b -> 'a **)
(* fstは多相的な関数 *)
let fst ((x, y): 'a * 'b) = x;;

let () =
  (* int * string *)
  printf "%d\n" (fst (1, "string"));
  (* float * (int * string) *)
  printf "%F\n" (fst (3.01, (3, "string")));
  printf "%d\n" @@ snd (12, 3)


