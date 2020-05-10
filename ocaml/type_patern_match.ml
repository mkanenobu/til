(* 構成要素にintとfloatを持つヴァリアント型 *)
type numbder_list =
  | Int of int
  | Float of float

(* numbder_listのint型の要素とfloat型の要素を別々に足し合わせる *)
let number_sum xs =
  let rec sum xs int_ float_ =
    match xs with
    | [] -> int_, float_
    | Int y :: ys -> sum ys (int_ + y) float_
    | Float y :: ys -> sum ys int_ (float_ +. y)
  in
  sum xs 0 0.0
;;

let () =
  let num_list = [ Int 3; Float 25.5; Int 10; Float 3.3 ] in
  let int_sum, float_sum = number_sum num_list in
  Printf.printf "sum of int: %d\n" int_sum;
  Printf.printf "sum of float: %F\n" float_sum
;;
