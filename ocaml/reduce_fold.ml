open Core

let l = [1;2;3;4;5]
let str_l = ["This"; "is"; "sring"; "list"]

let () =
  (* reduce fails on empty list *)
  (** (... f (f (f a1 a2) a3) ...) **)
  printf "%d\n" @@ List.reduce_exn l ~f:(fun acc x -> acc + x);
  printf "%S\n" @@ List.reduce_exn str_l ~f:(fun acc x -> sprintf "%s %s" acc x);

  (** f a1 (f a2 (... (f an init) ...)) **)
  printf "%S\n" @@ List.fold_right str_l
    ~f:(fun acc x -> sprintf "%s %s" acc x)
    ~init:(": fold right");

  (** f (... f (f (f init a1) a2) a3 ...) **)
  printf "%S\n" @@ List.fold_left str_l
    ~f:(fun acc x -> sprintf "%s %s" acc x)
    ~init:("fold left:");
