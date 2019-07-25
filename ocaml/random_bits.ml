open Core

let () =
  Random.self_init ();
  printf "%d\n" @@ Random.bits ();
