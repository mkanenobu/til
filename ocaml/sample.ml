let l = [1;2;3];;

let i = input_line stdin;;

let () =
  (* iはinput_lineが代入されたもの *)
  (* input_line stdinが２回行われるわけでは無い *)
  Printf.printf "%s\n" i;
  Printf.printf "%s\n" i;
