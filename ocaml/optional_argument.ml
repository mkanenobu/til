open Printf

let sample ?arg () =
  let s = match arg with
    | Some x -> x
    | None -> ""
  in
  printf "%S\n" s

let sample2 ?arg1 arg2 =
  printf "%S %S" arg2 (match arg1 with
      | Some x -> x
      | None -> "None")

let () =
  sample ();
  sample ?arg:(None) ();
  sample ?arg:(Some "string") ();
  sample2 "a";
  sample2 "a" ?arg1:(Some "b");
