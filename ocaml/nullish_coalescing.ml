open Core

let ( +++ ) (optional_value : string option) (default : string) : string =
  match optional_value with
  | Some v -> v
  | None -> default
;;

let () =
  Printf.printf "%s\n" @@ Sys.getenv "hogehoge" +++ "Hello, World"
;;
