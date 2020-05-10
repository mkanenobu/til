let f b = b

let () =
  (* assertは評価がtrueの場合unitを返し、falseの場合例外`Assert_failure`を発生させる *)
  assert (f true);
  assert (f false);
  (* not printing *)
  assert (print_endline "assertion" = ())
;;
