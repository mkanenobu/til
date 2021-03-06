(* int to float *)

;;
float_of_int 10 +. 0.1

(* as *)

;;
float 10 +. 0.1

(* float to int *)

;;
int_of_float 3.0 + 4

(* parse int *)

;;
string_of_int 3

(*
   float_of_int,
   int_of_float,
   char_of_int,
   int_of_char,
   string_of_int
*)

(* upcasting, downcasting *)
class window =
  object
    method close = Printf.printf "Close the window\n"
  end

class dialog =
  object
    inherit window

    method get_response = true
  end

let close_window (w : window) : unit = w#close

let () =
  let d = new dialog in
  (* upcasting *)
  close_window (d :> window)
;;
