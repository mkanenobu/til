open Core
open Sqlite3

let db_exec db query = ignore @@ Sqlite3.exec_not_null_no_headers db query
let db_prepare db query = Sqlite3.prepare db query

let () =
  let db = Sqlite3.db_open "./sqlite_sample.db" in
  db_exec db "DROP TABLE sample_table";
  db_exec db "CREATE TABLE sample_table(id INTEGER UNIQUE NOT NULL, name TEXT)";
  db_exec db "INSERT INTO sample_table VALUES(1, \"Bob\")";
  db_exec db "INSERT INTO sample_table VALUES(2, \"Alice\")";
  db_exec db "INSERT INTO sample_table VALUES(3, \"Sam\")";
  (* Readのみcallbackが呼ばれる *)
  ignore
  @@ Sqlite3.exec_not_null
       db
       ~cb:(fun row header ->
         Array.iter2_exn row header ~f:(fun row header ->
             printf "Header: %S, Row: %S\n" header row))
       "SELECT * FROM sample_table";
  let db_statement = db_prepare db "SELECT * FROM sample_table" in
  let column_count = Sqlite3.column_count db_statement in
  let data_count = Sqlite3.data_count db_statement in
  (* data count *)
  printf "Data count\n";
  printf "%d\n" data_count;
  (* print column names *)
  printf "Column names\n";
  let l = List.init column_count (fun x -> x) in
  List.iter l (fun n -> Sqlite3.column_name db_statement n |> printf "%S ");
  printf "\n"
;;
