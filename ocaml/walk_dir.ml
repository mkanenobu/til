let files = Array.to_list (Sys.readdir ".")
let filter_by_regex regex_pattern s = Str.string_match (Str.regexp regex_pattern) s 0
let () = List.iter print_endline (List.filter (filter_by_regex ".*.ml") files)
