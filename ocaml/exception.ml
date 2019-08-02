let () =
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
