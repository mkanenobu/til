open Core

(* enum *)
type oneTwoThree =
  | One
  | Two
  | Three

let one_two_three_to_int x =
  match x with
  | One -> 1
  | Two -> 2
  | Three -> 3
;;

let l : oneTwoThree list = List.rev [ One; Two; Three ]

(* 多相バリアント *)

(** [> `On | `Off] list **)
let l' = [ `On; `Off; `Number 10 ]

let to_int = function
  | `On -> 1
  | `Off -> 0
  | `Number n -> n
;;

(** [< `Number of int | `Off | `On ] -> [> `Number of int | `Off | `On ] **)
let switch = function
  | `On -> `Off
  | `Off -> `On
  | `Number x -> `Number (-x)
;;

let to_string = function
  | `On -> "On"
  | `Off -> "Off"
  | `Number n -> string_of_int n
;;

let () =
  List.iter l (fun x -> printf "%d\n" @@ one_two_three_to_int x);
  List.iter l' (fun x -> printf "%d\n" @@ to_int x);
  List.iter (List.map ~f:switch l') (fun x -> printf "%d\n" @@ to_int x);
  List.iter (List.map ~f:to_string l') (fun x -> printf "%S\n" x)
;;
