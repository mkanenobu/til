open Printf

let read_line_split =
  try Some (Str.split (Str.regexp " ") (input_line stdin))
  with _ -> None

(** is_parsable_float -> string -> bool **)
let is_parable s =
  try
    let _ = float_of_string s in
    true
  with _ -> false


(** push -> float -> float list -> float list **)
let push f stack =
  List.cons f stack

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

(** detect -> string -> float list -> float list **)
let detect e stack =
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

let print_list l =
  printf "[ ";
  List.iter (fun e -> printf "%F " e) l;
  printf "]";

  let main stack =
    let stack = [] in
    let splitted_line =
      match read_line_split with
      | Some string_line -> string_line
      | None -> printf "Invalid input\n"; exit 1 in
    List.iter (
      fun e ->
        let stack = (detect e stack) in
    ) splitted_line

let () =
  while true do
    let splitted_line =
      match read_line_split with
      | Some sl -> sl
      | None -> ignore (exit 1); ()
  done;

