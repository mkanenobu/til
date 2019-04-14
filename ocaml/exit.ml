let () =
  Printf.printf "before";
  ignore (exit 1);
  Printf.printf "after";
