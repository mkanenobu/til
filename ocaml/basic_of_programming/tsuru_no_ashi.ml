(* 鶴の数を取り、鶴の足の数を返す *)
(* int -> int *)
let tsuru_no_ashi x =
  x * 2
;;

(* int -> int *)
let kame_no_ashi x =
  x * 4
;;

(* int -> int -> int *)
let tsurukame_no_ashi tsuru kame =
  tsuru_no_ashi tsuru + kame_no_ashi kame
;;

(* int -> (int * int) *)
let tsurukame x y =
  let rec iter tsuru kame =
    if tsuru * 2 + kame * 4 = y then tsuru
    else iter (tsuru - 1) (kame + 1)
  in
  iter x 0
;;

let () =
  assert (tsuru_no_ashi 2 = 4);
  assert (tsuru_no_ashi 0 = 0);
  assert (kame_no_ashi 4 = 16);
  assert (kame_no_ashi 0 = 0);
  assert (tsurukame_no_ashi 2 4 = 20);
  assert (tsurukame_no_ashi 2 0 = 4);

  assert (tsurukame 8 26 = 3);
