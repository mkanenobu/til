open Core

let () =
  (* time function truncates float part *)
  let _epoch = Unix.time () in
  printf "%.10f\n" _epoch;

  (* epoch time *)
  let start = Unix.gettimeofday () in
  Unix.sleep 5;
  let end_ = Unix.gettimeofday () in
  printf "%.10f\n" (end_ -. start)

