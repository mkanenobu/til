open Printf

let print_int_list l =
  let len = List.length l in
  print_string "[";
  List.iteri (
    fun i e ->
      printf "%d" e;
      if i = len - 1 then
        printf "]"
      else
        printf " "
  ) l
;;

let print_string_list l =
  let len = List.length l in
  print_string "[";
  List.iteri (
    fun i e ->
      printf "%S" e;
      if i = len - 1 then
        printf "]"
      else
        printf " "
  ) l
;;

let print_float_list l =
  let len = List.length l in
  print_string "[";
  List.iteri (
    fun i e ->
      printf "%F" e;
      if i = len - 1 then
        printf "]"
      else
        printf " "
  ) l
;;

let print_float_list l =
  let len = List.length l in
  print_string "[";
  List.iteri (
    fun i e ->
      printf "%F" e;
      if i = len - 1 then
        printf "]"
      else
        printf " "
  ) l
;;

