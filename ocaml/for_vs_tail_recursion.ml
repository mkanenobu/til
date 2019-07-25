open Core

let () =
  for i = 0 to 10000 do
    Out_channel.output_string stdout "";
  done
