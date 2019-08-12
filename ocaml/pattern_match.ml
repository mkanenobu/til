open Printf

let t = [6;2;3;4;5];;
let words = ["one"; "two"; "three"];;

let nth l =
  match l with
  | [] -> 0
  | x::xs -> x;;
;;

let is_empty_list l =
  match l with
  | [] -> true
  | _ -> false
;;

(* or pattern *)
(* redundant *)
let _is_operater c =
  match c with
  | '+' | '-' | '*' | '/' -> true
  | _ -> false
;;
(* good *)
let is_operater = function
  | '+' | '-' | '*' | '/' -> true
  | _ -> false
;;

(* returns last element 'a list -> 'a option *)
let rec last = function
  | [] -> None
  | [x] -> Some x
  | _ :: t -> last t
;;

let () =
  printf "%d\n" (nth t) ;
  printf "%b\n" (is_empty_list t);
  printf "%b\n" (is_empty_list []);
  printf "%b\n" (is_operater '+');
  let a, b, c = match ["1"; "2"; "3"] with
    | a :: b :: c -> a, b, c
    | a :: b -> ("-1"), a, b
    | _ -> "-1", "-1", []
  in
  printf "%S\n" a;
  printf "%S\n" b;


