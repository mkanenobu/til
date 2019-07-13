(* http://www.fos.kuis.kyoto-u.ac.jp/~igarashi/class/pl/03-ocaml.html *)
open Core

type point = {x: int; y: int}

let point_a = {x = 10; y = -4}


let () =
  (* Dot notation *)
  printf "x = %d\n" point_a.x;
  (* pattern match *)
  let {x = ax; y = ay} = point_a in
  printf "x = %d, y = %d\n" ax ay;

  let point_b = {x = 100; y = 0} in
  (* patten match argument *)
  let f {x = px; y = py} = sprintf "x = %d, y = %d" px py in
  printf "%s\n" @@ f point_b;

  let only_x {x} = sprintf "x = %d" x in
  printf "%s\n" @@ only_x point_b;
