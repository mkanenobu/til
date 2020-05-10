open Printf

let count l x = List.filter (fun x' -> x' = x) l |> List.length

let kiyoshi () =
  let is_kiyoshi l =
    if List.hd (List.rev l) = "ドコ" && count l "ドコ" = 1 then true else false
  in
  Random.self_init ();
  let s_l =
    List.init 5 (fun _ -> Random.bool ())
    |> List.map (fun b -> if b then "ズン" else "ドコ")
  in
  List.iter (fun s -> printf "%s " s) s_l;
  if is_kiyoshi s_l
  then (
    printf "キヨシ!\n";
    true)
  else (
    printf "\n";
    false)
;;

let () =
  while not (kiyoshi ()) do
    ()
  done
;;
