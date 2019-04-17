let pi = 3.1415926535

let area_of_circle (r: float) =
  r ** 2.0 *. pi
;;


let () =
  Printf.printf "%F\n" (area_of_circle 3.0)
