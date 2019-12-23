open Core

let read_line = In_channel.input_all In_channel.stdin

let () =
  printf "%s" read_line
