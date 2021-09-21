open Opium;;

let sys_json _req =
  let json : Yojson.Safe.t =
    `Assoc [ "os-type", `String Sys.os_type; "ocaml-version", `String Sys.ocaml_version ]
  in
  Response.of_json json |> Lwt.return
;;

let _ =
  let port = match Sys.getenv_opt "PORT" with
  | Some p -> int_of_string p;
  | None -> 8080
  in

  Printf.printf "http://localhost:%d\n" port;

  App.empty
  |> App.port port
  |> App.middleware Middleware.logger
  |> App.get "/" sys_json
  |> App.run_command 
;;