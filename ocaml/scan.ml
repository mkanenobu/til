let () =
  (* fun~は無名関数 *)
  Scanf.scanf "%d %d" (fun a b -> Printf.printf "%d\n" (a + b))
;;
