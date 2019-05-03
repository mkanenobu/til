open Printf;;

let () =
  printf "%d\n" (1 + 3);
  printf "%d\n" (10 * 3);

  (* append '.' after operater in floating calc *)
  (* different formats *)
  printf "%F\n" (3.12 *. 4.3);
  printf "%F\n" (3.0 /. 4.3);
  printf "%F\n" (3.12 *. 4.3);
  printf "%F\n" (5.3 -. 3.0);

  printf "%d\n" (30 mod 7);
  printf "%F\n" (20.0 ** 2.0);

  (* cast *)
  printf "%F\n" (float 3 /. 1.1);
  (* floor *)
  printf "%d\n" (int_of_float (floor 3.6));
  printf "%d\n" (int_of_float (Core.Float.round_down 3.6));
  (* ceil *)
  printf "%d\n" (int_of_float (ceil 3.6));
  printf "%d\n" (int_of_float (Core.Float.round_up 3.6));
