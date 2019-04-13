let myList = [1; 2; 3; 4; 5; 6; 7; 8; 9];;

(* 再帰 *)
let f elem =
  Printf.printf "%d\n" elem in
    List.iter f myList;;

(* 無名関数 *)
let () =
  List.iter (fun s -> Printf.printf "%n\n" s) myList;;
