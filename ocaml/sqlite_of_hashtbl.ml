open Core
open Sqlite3

(*
DBからSELECTした値を
key: カラム名, value: [data]
形のHashtblにする
 *)

let hash_table = Hashtbl.create (module String)
let db = Sqlite3.db_open "./sqlite_sample.db"
let db_exec db query = ignore @@ Sqlite3.exec_not_null_no_headers db query

let () =
  (* insert sample values *)
  db_exec db "DROP TABLE sample_table";
  db_exec db "CREATE TABLE sample_table(id INTEGER UNIQUE NOT NULL, name TEXT)";
  db_exec db "INSERT INTO sample_table VALUES(1, \"Bob\")";
  db_exec db "INSERT INTO sample_table VALUES(2, \"Alice\")";
  db_exec db "INSERT INTO sample_table VALUES(3, \"Sam\")";
  ignore
  @@ Sqlite3.exec_not_null
       db
       ~cb:(fun row headers ->
         Array.iter2_exn row headers ~f:(fun row header ->
             Hashtbl.set
               hash_table
               header
               (row
               ::
               (match Hashtbl.find hash_table header with
               | Some x -> x
               | None -> []))))
       "SELECT * FROM sample_table";
  Hashtbl.iteri hash_table ~f:(fun ~key ~data ->
      printf "Key:\n  %S\n" key;
      printf "Data:\n";
      List.iter data ~f:(fun datum -> printf "  %S\n" datum));
  ignore @@ Sqlite3.db_close db
;;
