(** Reverse Polish Notation Caliculator impl in OCaml **)
open Printf

type t_stack = float list

let exit_with_message = function
  | "stack_underflow" ->
    printf "Stack underflow\n";
    exit 1
  | "invalid_input" ->
    printf "Invalid input\n";
    exit 2
  | _ ->
    printf "Unknown error\n";
    exit 3
;;

(* is_parsable: string -> bool **)
let is_parsable s =
  try
    let _ = float_of_string s in
    true
  with
  | _ -> false
;;

(** push: float -> float list -> t_stack **)
let push (f : float) (stack : t_stack) = f :: stack

(** pop: float list -> float * t_stack **)
let pop (stack : t_stack) =
  ( (try List.hd stack with
    | _ -> exit_with_message "stack_underflow")
  , try List.tl stack with
    | _ -> exit_with_message "stack_underflow" )
;;

(** calc: string -> t_stack -> t_stack **)
let calc op (stack : t_stack) =
  let f1, stack' = pop stack in
  let f2, stack' = pop stack' in
  match op with
  | "+" -> push (f2 +. f1) stack'
  | "-" -> push (f2 -. f1) stack'
  | "*" -> push (f2 *. f1) stack'
  | "/" -> push (f2 /. f1) stack'
  | _ -> exit_with_message "unknown"
;;

(** push_or_calc: string -> float list -> float list **)
let push_or_calc e stack =
  match e with
  | "." ->
    (* pop and show *)
    let f, stack' = pop stack in
    printf "%F\n" f;
    stack'
  | "+" | "-" | "*" | "/" -> calc e stack
  | _ when is_parsable e -> push (float_of_string e) stack
  | _ -> exit_with_message "invalid_input"
;;

(** print_stack: t_stack -> unit **)
let print_stack (l : t_stack) =
  printf "<%d> " (List.length l);
  print_string "[";
  List.iter (printf "%F ") (List.rev l);
  print_string "]";
  print_string "\n"
;;

(** main: t_stack -> string list -> t_stack **)
let main stack (splitted_line : string list) =
  let m = List.length splitted_line in
  let rec iter n stack' =
    if n < m
    then iter (n + 1) (push_or_calc (List.nth splitted_line n) stack')
    else stack'
  in
  iter 0 stack
;;

let stack = ([] : t_stack)

let () =
  let rec iter (stack' : t_stack) =
    let read_line_split =
      try Str.split (Str.regexp " ") (input_line stdin) with
      | _ -> exit_with_message "invalid_input"
    in
    let stack_ = main stack' read_line_split in
    print_stack stack_;
    flush stdout;
    iter stack_
  in
  iter stack
;;
