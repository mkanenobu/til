(* same as C++'s '"using namespace" *)
open Printf

(* open as *)
module P = Printf

let () =
  printf "sample\n";
  Printf.printf "sample\n";
  P.printf "sample\n"
;;
