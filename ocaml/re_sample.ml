open Core

let () =
  Re.matches (Re.Pcre.regexp "\\w{1,}") " string 123"
  |> List.iter ~f:(fun x -> print_endline x)
;;
