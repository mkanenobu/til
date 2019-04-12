let () =
  (* Sys.command return exit code *)
  Printf.printf "%d" (Sys.command "ls")
