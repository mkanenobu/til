open Core
open Printf

let () =
  (* time function truncates float part *)
  let _epoch = Unix.time () in

  (* epoch time *)
  let start = Unix.gettimeofday () in
  Unix.sleep 5;
  let end_ = Unix.gettimeofday () in
  Printf.printf "%.10f\n" (end_ -. start)

