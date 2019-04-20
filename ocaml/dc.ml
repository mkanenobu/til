(** Reverse Polish Notation Caliculator impl in OCaml **)
open Printf;;

let exit_with_error e =
  begin match e with
    | "stack_underfrow" -> printf "Stack underflow\n"
    | "invalid_input" -> printf "Invalid input\n"
    | _ -> printf "Unknown error\n"
  end;
  exit 1
;;

(* is_parsable: string -> bool **)
let is_parsable s =
  try
    let _ = float_of_string s in
    true
  with _ -> false
;;

(** push: 'a -> 'a list -> 'a list **)
let push f stack =
  f :: List.rev stack
;;

(** pop: 'a list -> 'a -> 'a list **)
let pop stack =
  (
    try List.hd stack
    with _ -> exit_with_error "stack_underflow"
  ),
  List.tl stack
;;

(** calc: string -> float list -> float list **)
let calc op stack =
  let (f1, stack') = pop stack in
  let (f2, stack') = pop stack' in
  begin match op with
    | "+" -> push (f2 +. f1) stack'
    | "-" -> push (f2 -. f1) stack'
    | "*" -> push (f2 *. f1) stack'
    | "/" -> push (f2 /. f1) stack'
    | _ -> exit_with_error "unknown"
  end
;;

(** push_or_calc: string -> float list -> float list **)
let push_or_calc e stack =
  match e with
  | "." ->
    begin
      (* pop and show *)
      let (f, stack') = pop stack in
      printf "%F\n" f;
      stack'
    end
  | "+" | "-" | "*" | "/" -> calc e stack
  | _ when (is_parsable e) -> push (float_of_string e) stack
  | _ -> exit_with_error "invalid_input"
;;

(** print_list: float list -> unit **)
let print_list (l: float list) =
  print_string "[";
  List.iter (fun e -> printf "%F " e) l;
  print_string "]";
  print_string "\n";
;;


let main stack (splitted_line: string list) =
  let m = List.length splitted_line in
  let rec iter n stack' =
    if n < m then
      iter (n + 1) (push_or_calc (List.nth splitted_line n) stack')
    else
      stack'
  in
  iter 0 stack
;;


let stack: float list = [];;

let () =
  let rec iter stack' =
    let read_line_split =
      try Str.split (Str.regexp " ") (input_line stdin)
      with _ -> exit_with_error "invalid_input"
    in
    let stack_ = main stack' read_line_split in
    print_list stack_;
    flush stdout;
    iter stack_;
  in
  iter stack
;;

