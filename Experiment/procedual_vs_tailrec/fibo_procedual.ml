let procedual n =
  let n1 = ref 0 in
  let n2 = ref 1 in
  let acc = ref 0 in
  if n = 0 then 0
  else
    begin
      for i = 1 to n do
        acc := !n1 + !n2;
        n1 := !n2;
        n2 := !acc;
      done;
      !n1
    end
;;

let () =
  Printf.printf "%d\n" (procedual 100);

