let () =
  (* Obj.magic: 'a -> 'b *)
  Printf.printf "%d\n" (Obj.magic "100")
;;
