open Printf

let stack_underfrow = 1;;

(** is_parsable_float -> string -> bool **)
let is_parable s =
  try
    let _ = float_of_string s in
    true
  with _ -> false

(** push -> float -> float list -> float list **)
let push f stack =
  f :: List.rev stack

(** pop -> float list -> float -> float list **)
let pop stack =
  (try List.hd stack
   with _ -> failwith "Stack underflow"),
  List.tl stack

(** calc -> string -> float list -> float list **)
let calc op stack =
  let (f1, stack') = pop stack in
  let (f2, stack') = pop stack' in
  match op with
  | "+" -> push (f2 +. f1) stack'
  | "-" -> push (f2 -. f1) stack'
  | "*" -> push (f2 *. f1) stack'
  | "/" -> push (f2 /. f1) stack'
  | _ -> failwith "Parse error"

(** push_or_calc -> string -> float list -> float list **)
let push_or_calc e stack =
  match e with
  | "." ->
    begin
      (* pop and show *)
      let (f, stack') = pop stack in
      Printf.printf "%F\n" f;
      stack'
    end
  | "+" | "-" | "*" | "/" ->
    begin
      calc e stack
    end
  | _ when (is_parable e) -> push (float_of_string e) stack
  | _ -> printf "Invalid input\n"; exit 1

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
      with _ -> printf "Invalid input\n"; exit 1
    in
    let stack_ = main stack' read_line_split in
    print_list stack_;
    flush stdout;
    iter stack_;
  in
  iter stack
;;

