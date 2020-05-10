let () =
  (* procedual *)
  let c = ref true in
  let i = ref 0 in
  while !c do
    Printf.printf "%d\n" !i;
    if i > ref 10 then c := false else i := !i + 1
  done;
  for i = 0 to 10 do
    Printf.printf "%d\n" i
  done
;;
