let () =
  try raise Exit
  with Exit -> Printf.printf "catch exception"; ignore (exit 1);
    Printf.printf "this expr will not evaluate"
;;
