let rec yes_rec word =
  print_string @@ word ^ "\n";
  yes_rec word
;;

let yes_while word =
  while true do
    print_string @@ word ^ "\n"
  done
;;

let () =
  (* recursion is 10x faster *)
  (* yes_while "y"; *)
  yes_rec "y";
