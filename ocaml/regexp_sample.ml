let str_replace target ~regex ~replace =
  let pattern = Str.regexp regex in
  Str.global_replace pattern replace target

let re2_replace target ~regex ~replace =
  let pattern = Re2.create_exn regex in
  Re2.replace_exn ~f:(fun _ -> replace) pattern target

let re_replace target ~regex ~replace =
  let pattern = Re.Pcre.regexp regex in
  Re.replace_string pattern replace target

let () =
  let str = "ABCdef" in
  print_endline @@ re_replace str ~regex:("ABC") ~replace:"xxx"
