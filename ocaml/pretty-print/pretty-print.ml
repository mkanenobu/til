open Printf
open String

(* TODO: change display style if has many elements *)
let string_of_array arr = "[" ^ (concat "; " arr) ^ "]"

type printable =
  | Int of int
  | Float of float
  | String of string
  | StringList of string list
  | IntList of int list
  | FloatList of float list

class wrapper =
  object (self)
    method print = printf "%s\n"
  end

