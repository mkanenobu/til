let is_parsable_float s =
  try
    let _ = float_of_string s in
    true
  with _ -> false

let () =
  Printf.printf "%b\n" (is_parsable_float "123");
  Printf.printf "%b\n" (is_parsable_float "abc")
