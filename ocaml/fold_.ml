open Core

let l = [1; 2; 3; 4; 5]

let () =
  let str_l = List.fold l ~init:("") ~f:(
      fun acc x -> acc ^ (string_of_int x)
    ) in
  printf "%s\n" str_l;
