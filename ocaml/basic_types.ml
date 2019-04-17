(* int  depends on CPU, 31bit or 63bit *)
let i = 10;;

(* binary *)
let binary = 0b101;;

(* octal (8) *)
let octal = 0o1703;;

(* hexadecimal (16) *)
let hex = 0xAF01;;

(* float same as C's double *)
let f = 5.4;;

(* bool *)
let b = true;;

(* char 8bit *)
let c = 'x';;

(* string *)
let s = "string";;

(* unit (like void) *)
let u = ();;

(* list *)
let l = [1; 2; 3; 4; 5];;

(* array *)
let a = [|1; 2; 3;|];;

let print n =
  Printf.printf "%d\n" n

let () =
  print binary;
  print octal;
  print hex;
