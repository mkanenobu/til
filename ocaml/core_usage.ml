open Core

let () =
  let list_count_down n = List.init n ~f:(fun n' -> abs (n' - n)) in
  let l = List.init 10 (fun n -> n) in
  (* printfがCore直下に入っている *)
  (* CoreではLabeled Argumentが多用されている *)
  List.iter l ~f:(fun n -> printf "%d\n" n);
  List.iteri (list_count_down 12) ~f:(fun i n -> printf "%d番目: %d\n" i n);
  let str = String.strip "    xyz    " in
  printf "%S\n" str;
  let str_list = String.split "a b c d e f" ~on:' ' in
  List.iter str_list ~f:(fun s -> printf "%S\n" s);
  printf "%S\n" @@ String.concat ?sep:(Some ", ") [ "a"; "b"; "c" ]
;;
