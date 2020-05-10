open Core

let () =
  (* get $HOME *)
  printf "%s\n" @@ Sys.getenv_exn "HOME";
  (* set env *)
  Unix.putenv "OCAML_SAMPLE_ENV" "Hello, OCaml!";
  printf "%s\n" @@ Sys.getenv_exn "OCAML_SAMPLE_ENV"
;;
