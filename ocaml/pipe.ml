open Str
open Printf

let l = [5;4;3;2;1]

(* |> : 'a -> ('a -> 'b) -> 'b *)

(* pipe_sample: int list -> string list  *)
let pipe_sample list_ =
  (* 全てにの要素に2を掛け *)
  list_ |> List.map (fun e -> e * 2)
  (* 4で割り切れないもののみを残し *)
  |> List.filter (fun e -> e mod 4 <> 0)
  (* 文字列化 *)
  |> List.map (sprintf "%d")
;;

let () =
  List.iter (fun e -> printf "%S\n" e) (pipe_sample l);

  let li: int list = "1 2 3 4 5"
                     |> split (regexp " ")
                     |> List.map (fun e -> int_of_string e) in
  List.iter (fun s -> Printf.printf "%d\n" s) li;
