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

  (* cast *)
  printf "%F\n" (float 3 /. 1.1);
  (* like floor, but floor is not convert type *)
  printf "%d\n" ((int_of_float 3.6) + 1);
  (* ceil *)
  printf "%d\n" (int_of_float (ceil 3.6) + 1);
