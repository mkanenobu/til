let () =
  let _ =
    try
      Core.protect
      (* fの中でexceptionが発生してもfinallyの中身は必ず実行される *)
        ~f:(fun () -> raise Exit)
        ~finally:(fun () -> print_endline "finally")
    with _ -> ()
  in

  let _ =
    try
      raise Exit;
    with
    | Exit -> Printf.printf "catch exception \"Exit\"\n";
    | _ -> Printf.printf "catch other exception";
  in

  (* evaluate *)
  Printf.printf "end of extern\n";

  try
    raise Exit;
  with
  | Exit -> Printf.printf "catch exception \"Exit\"\n";
  | _ -> Printf.printf "catch other exception";

    (* not evaluate (inside 'with' statement) *)
    Printf.printf "end of extern";
