open Base
open Core

let random n = Random.int n

let () =
  Random.self_init ();
  for i = 0 to 10 do
    Printf.printf "%d\n" @@ random 100;
    Out_channel.flush stdout;
  done
