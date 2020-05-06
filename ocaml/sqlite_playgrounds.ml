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
  let header = ref [||] in
  ignore
  @@ Sqlite3.exec_not_null
       db
       (fun row header_ ->
         header := header_;
         result := Array.append !result [| row |])
       query_string;
  !header, !result
;;

let get_values_by_column (result : db_result) column =
  let header, values = result in
  let index = find_index ~predicate:(fun v -> String.equal v column) header in
  Array.map ~f:(fun v -> v.(index)) values
;;

let array_to_string arr = Array.fold ~f:(fun acc s -> acc ^ "," ^ s) ~init:"" arr ^ "\n"

let () =
  let google_chrome_search_provider =
    "/Users/kanenobu/Library/Application Support/Google/Chrome/Default/Web Data"
  in
  let db = Sqlite3.db_open google_chrome_search_provider in
  let result = get_rows db "SELECT * FROM keywords" in
  ignore @@ Sqlite3.db_close db;
  let header, values = result in
  print_endline "Headers";
  header |> Array.iter ~f:(fun h -> printf "%s, " h);
  printf "\n";
  print_endline "Values";
  values |> Array.iter ~f:(fun h -> printf "%s, " @@ array_to_string h);
  printf "\n";
  Array.iter ~f:(fun v -> printf "%s, " v) (get_values_by_column result "id")
;;
