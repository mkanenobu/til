let tuple_in_tuple = ((123, 'a'), (3.0, "string", true))

let () =
  let ((first_e, _), _) = tuple_in_tuple in
  print_int first_e
