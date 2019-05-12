open Core

let () =
  Random.self_init ();
  while true do
    Printf.printf "%d\n" @@ Random.int Int.max_value;
    Out_channel.flush stdout;
  done
