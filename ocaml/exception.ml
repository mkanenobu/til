open Core
(* 例外定義 *)
exception User_error

let () =
  let _ =
    try
      raise User_error;
    with
    | User_error -> printf "catch exception \"Exit\"\n";
    | _ -> printf "catch other exception";
  in

  (* finally *)
  let _ =
    try
      Core.protect
        (* fの中でexceptionが発生してもfinallyの中身は必ず実行される *)
        ~f:(fun () -> raise (Failure "fail"))
        ~finally:(fun () -> print_endline "finally")
    with _ -> ()
  in

  (* evaluate *)
  printf "end of extern\n";

  try
    raise Exit;
  with
  | Exit -> printf "catch exception \"Exit\"\n";
  | _ -> printf "catch other exception";

    (* not evaluate (still in `with` statement) *)
    Printf.printf "end of extern";
