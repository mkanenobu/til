
let rec loop i =
  Printf.printf "%d\n" i;
  if i <= 4 then loop (i + 1)
in

Printf.printf "Loop starts 0\n";
loop 0;

Printf.printf "Loop starts 3\n";
loop 3;
