open Core

let kiyoshi () =
  let is_kiyoshi l =
    if ((List.last_exn l = "ドコ") && (List.count l ~f:(fun x -> x = "ドコ") = 1)) then true
    else false
  in

  Random.self_init ();

  let s_l = List.init 5 ~f:(fun _ -> Random.bool ()) |>
            List.map ~f:(fun b -> if b then "ズン" else "ドコ") in

  List.iter s_l ~f:(fun s -> printf "%s " s);

  if is_kiyoshi s_l then (
    printf "キヨシ!\n";
    false
  ) else (
    printf "\n";
    true
  )
;;

let () =
  while kiyoshi () do
    ()
  done
