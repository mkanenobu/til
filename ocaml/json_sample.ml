open Core
module Json = Yojson.Basic

let ordinary_json () =
  let json = Json.from_file "./json_sample.json" in
  printf "%s\n" @@ Json.to_string json
;;

type json2 = { key : string } [@@deriving show]

let array_json () =
  let parse (json : Json.t list) : json2 list =
    json |> List.map ~f:(fun j -> { key = Json.Util.member "key" j |> Json.to_string })
  in
  let json = Json.from_file "./json_sample_array.json" in
  let listed = Json.Util.to_list json in
  listed |> parse |> List.iter ~f:(fun node -> print_endline (show_json2 node))
;;

let () =
  ordinary_json ();
  array_json ()
;;
