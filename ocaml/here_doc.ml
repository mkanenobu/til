open Core

let here_doc = {eos|
Hello,
World!
|eos}

let here_doc2 = {eos|Hello,
World!|eos}

let () =
  print_endline here_doc;
  print_endline here_doc2
;;
