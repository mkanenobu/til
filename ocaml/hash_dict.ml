open Printf

let table = Hashtbl.create 100
(* Base版はkeyの型を指定する必要がある *)
let base_table = Base.Hashtbl.create (module Base.String) ?size:(Some 100)


let () =
  Hashtbl.add table "one" 1;
  Hashtbl.add table "two" 2;
  Hashtbl.add table "three" 3;

  Base.Hashtbl.add_exn base_table "one" 1;
  Base.Hashtbl.add_exn base_table "two" 2;
  Base.Hashtbl.add_exn base_table "three" 3;
  (* addは重複するkeyが存在する場合、戻り値として`Duplicateを返す。
     追加に成功した場合`Okを返す *)
  let result = Base.Hashtbl.add base_table "three" 3 in
  assert (result = `Duplicate);
  (* add_exnは重複するkeyが存在する場合、例外を投げる *)
  let _ =
    try
      Base.Hashtbl.add_exn base_table "three" 3;
    with _ ->
      print_endline "key: three is already exists";
  in

  (* keyの存在確認 *)
  if Base.Hashtbl.existsi base_table ~f:(fun ~key ~data -> key = "one")
  then print_endline "key: \"one\" exists"
  else print_endline "key: \"one\" does not exists"



