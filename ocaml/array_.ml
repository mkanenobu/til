let a = [| 1; 2; 3 |]

let () =
  Array.iter
    (function
      | e -> Printf.printf "%d\n" e)
    a
;;
