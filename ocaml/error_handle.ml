let square_area f =
  match f with
  | f when f < 0.0 -> failwith "under 0"
  | f when f >= 0.0 -> f ** 2.0
  | _ -> failwith "other"
;;

let () =
  let area = square_area 3.0 in
  Printf.printf "%F\n" area;
  let area =
    try square_area (-3.0) with
    | _ ->
      Printf.printf "error";
      exit 1
  in
  Printf.printf "%F\n" area
;;
