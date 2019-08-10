open Core

(* stringはほぼdeprecated扱い *)

let () =
  let bytes1 = Bytes.create 2 in
  (* set nth char *)
  Bytes.set bytes1 0 'H';
  Bytes.set bytes1 1 'i';
  printf "%s\n" @@ Bytes.to_string bytes1;

  (* initialize *)
  let bytes2 = Bytes.make 8 'a' in
  printf "%s\n" @@ Bytes.to_string bytes2;

  (* create from string *)
  let bytes3 = Bytes.of_string "Hello, World!" in
  printf "%s\n" @@ Bytes.to_string bytes3;

  (* get nth char *)
  printf "%c\n" @@ Bytes.get bytes3 0;

