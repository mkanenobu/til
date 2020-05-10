open Printf

type number =
  [ `Float of float
  | `Int of int
  ]

type number_ordinal =
  | Float of float
  | Int of int

(** f: [< `Float of Float | `Int of int] -> float **)
let float_of_number = function
  | `Int x -> float x
  | `Float x -> x
;;

let float_of_number2 = function
  | Int x -> float x
  | Float x -> x
;;

let () =
  printf "%f\n" @@ float_of_number (`Int 10);
  printf "%f\n" @@ float_of_number (`Float 0.3333);
  printf "%f\n" @@ float_of_number2 (Int 10);
  printf "%f\n" @@ float_of_number2 (Float 2.3)
;;
