open Printf

let print_int_list l =
  printf "[";
  List.iter (fun e -> printf "%d; " e) l;
  printf "\b]"
;;

let print_float_list l =
  printf "[";
  List.iter (fun e -> printf "%F; " e) l;
  printf "]"
;;

let print_string_list l =
  printf "[";
  List.iter (fun e -> printf "%S; " e) l;
  printf "]"
;;

let print_char_list l =
  printf "[";
  List.iter (fun e -> printf "%C; " e) l;
  printf "]"
;;

let () =
  print_int_list [1;2;3]
