open Core;;
(* 1h *)
let h = 3600;;
(* 1m *)
let m = 60;;

let () =
  let s = h * 3 + m * 2 + 3 in

  let to_string seconds =
    let hours = seconds / 3600 mod 100 in
    let minutes = seconds mod 3600 / 60 in
    let sec = seconds mod 60 in
    printf "%02d:%02d:%02d"  hours minutes sec
  in
  to_string s

