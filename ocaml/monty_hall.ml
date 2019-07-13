open Core

let random n = Random.int n

let () =
  Random.self_init ();
  let l = List.init 100 (fun _ -> random 3) in
  List.iter l (fun n -> printf "%d\n" n);
