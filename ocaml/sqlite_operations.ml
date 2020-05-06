open Core
open Sqlite3

let find_index ~predicate arr =
  let index, _ = Array.findi_exn ~f:(fun index value -> predicate value) arr in
  index
;;

type row = string array
type column_name = string
type db_result = column_name array * row array

let get_rows db query_string : db_result =
  let result = ref [||] in
  let columns = ref [||] in
  ignore
  @@ Sqlite3.exec_not_null
       db
       (fun row column ->
         columns := column;
         result := Array.append !result [| row |])
       query_string;
  !columns, !result
;;

let get_values_by_column (result : db_result) column =
  let header, values = result in
  let index = find_index ~predicate:(fun v -> String.equal v column) header in
  Array.map ~f:(fun v -> v.(index)) values
;;
