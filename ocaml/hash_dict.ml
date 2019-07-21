open Core
(* Core(Base)版のHashtbl *)

(* keyの型を指定する必要がある *)
let table = Hashtbl.create (module String)

let () =
  Hashtbl.add_exn table "one" 1;
  Hashtbl.add_exn table "two" 2;
  Hashtbl.add_exn table "three" 3;
  (* addは重複するkeyが存在する場合、戻り値として`Duplicateを返す。
     追加に成功した場合`Okを返す *)
  let result = Hashtbl.add table "three" 3 in
  assert (result = `Duplicate);
  (* add_exnは重複するkeyが存在する場合、例外を投げる *)
  let _ =
    try
      Hashtbl.add_exn table "three" 3;
    with _ ->
      print_endline "key: three is already exists";
  in

  (* keyの存在確認 *)
  assert (Hashtbl.mem table "one");

  (* valueの存在確認 *)
  assert (
    Hashtbl.exists table ~f:(fun data -> data = 1)
  );

  (* keyとvalueの組み合わせの存在確認 *)
  assert (
    Hashtbl.existsi table ~f:(
      fun ~key ~data -> (key = "one") && (data = 1)
    )
  );

