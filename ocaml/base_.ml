open Base
open Printf

(* Base is mainly used for IO *)
let () =
  let str = "string" in
  (* stdout *)
  Stdio.print_endline str;
  (* stderr *)
  Stdio.prerr_endline str;
