open Core

let db_exec db query =
  ignore @@ Sqlite3.exec_not_null_no_headers db (
    fun _ -> ()
  ) query

let () =
  let db = Sqlite3.db_open "./sqlite_sample.db" in
  db_exec db "DROP TABLE sample_table";
  db_exec db "CREATE TABLE sample_table(id INTEGER UNIQUE NOT NULL, name TEXT)";

  ignore @@ Sqlite3.exec_not_null_no_headers db (fun _ -> ())
    "INSERT INTO sample_table values(1, \"Bob\")";
  ignore @@ Sqlite3.exec_not_null_no_headers db (fun _ -> ())
    "INSERT INTO sample_table values(2, \"Alice\")";
  ignore @@ Sqlite3.exec_not_null_no_headers db (fun _ -> ())
    "INSERT INTO sample_table(id) values(2)";

  let result = ref [||] in
  ignore (Sqlite3.exec_not_null db (
      fun row header ->
        result := Array.append !result row;
        (* Array.iter row ~f:(fun e -> printf "%s: \n" e); *)
    ) "select * from sample_table");
  ignore @@ Sqlite3.db_close db;

  Array.iter !result ~f:(fun e -> printf "%s\n" e);
