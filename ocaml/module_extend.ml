
(* Listモジュールの一部のように定義する
   標準のListモジュールの全て + 新たに定義したcount関数を持つ、
   Extension.Listモジュールを生成している
*)

module List = struct
  include List
  let count l ~f = List.filter f l |> List.length
end


let l = [1; 2; 2; 3; 3; 3]
let () =
  assert (List.count l ~f:(fun e -> e = 1) = 1);
  assert (List.count l ~f:(fun e -> e = 2) = 2);
  Printf.printf "%d\n" (List.count l ~f:(fun e -> e = 3));

