open Core

let () =
  let str = "String ABCdef" in
  let replace = (Staged.unstage (String.tr_multi ~target:str ~replacement:"aaaa")) in
  printf "%S\n" (replace str)

