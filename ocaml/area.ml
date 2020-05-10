open Core

type point =
  { x : int
  ; y : int
  }

let point1 = { x = 0; y = 10 }
let point2 = { x = 10; y = 20 }

let area ({ x = p1x; y = p1y }, { x = p2x; y = p2y }) =
  let x_distance = float @@ abs (p1x - p2x) in
  let y_distance = float @@ abs (p1y - p2y) in
  sqrt ((x_distance ** 2.0) +. (y_distance ** 2.0))
;;

let () = printf "%F\n" @@ area (point1, point2)
