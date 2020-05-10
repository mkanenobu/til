open Printf

let s = "Hello"

(* escape sequences *)
let backslash = "\\"
let single_quote = '\'' (* only use in single quote *)

let double_quote = "\"" (* only use in double quote *)

let cr = "\n"
let return = "\r" (* back to line head *)

let tab = "\t"
let backspace = "\b"
let decimalAsAscii = "\090"
let hexAsAscii = "\x4F"
let print s = printf "%s\n" s

let () =
  (* join strings *)
  print (s ^ ", World!");
  print backslash;
  printf "%c\n" single_quote;
  print double_quote;
  printf "%S\n" cr;
  print return;
  print tab;
  print backspace;
  print decimalAsAscii;
  print hexAsAscii
;;
