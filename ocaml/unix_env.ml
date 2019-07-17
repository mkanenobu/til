open Printf

let () =
  (* get $HOME *)
  printf "%s\n" @@ Unix.getenv "HOME";

  (* set env *)
  Unix.putenv "OCAML_SAMPLE_ENV" "Hello, Ocaml!";
  printf "%s\n" @@ Unix.getenv "OCAML_SAMPLE_ENV";
