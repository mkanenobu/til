let () =
  let b = ref false in
  while not !b do
    print_string "(y/n): ";
    let str = read_line () in
    print_endline str;
    if str.[0] = 'y' then b := true
  done;

