let l = [5;4;3;2;1]

(* |> : 'a -> ('a -> 'b) -> 'b *)

(* pipe: int list -> string list  *)
let pipe list_ =
  (* 全てにの要素に2を掛け *)
  list_ |> List.map (fun e -> e * 2)
  (* 4で割り切れないもののみを残し *)
  |> List.filter (fun e -> e mod 4 <> 0)
  (* 文字列化 *)
  |> List.map (Printf.sprintf "%d")
;;

let () =
  List.iter (fun e -> Printf.printf "%S\n" e) (pipe l);

