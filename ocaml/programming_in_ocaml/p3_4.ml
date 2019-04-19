let average1 x y =
  (x +. y) /. 2.0

let average2 p =
  let (x, y) = p in
  (x +. y) /. 2.0

let average3 (x, y) =
  (x +. y) /. 2.0

let sum_and_diff (x, y) =
  (x + y, abs (x - y))

let () =
  let pair = (0.34, 1.2) in
  Printf.printf "%F\n" (average1 3.0 1.2);
  Printf.printf "%F\n" (average2 (3.0, 1.2));
  Printf.printf "%F\n" (average3 (3.0, 1.2));
  Printf.printf "%F\n" (average3 pair);
  let (x, y) = sum_and_diff (3, 5) in
  Printf.printf "%d\n" x;
  Printf.printf "%d\n" y;
