open Core

class sample (param : string) =
  object (self)
    (* constructor, initialize params assign to instance variable *)
    val mutable param = param

    (* these `param` are instance variable (not initialize param) *)
    method get_param = param

    method set_param s = param <- s
  end

let () =
  let sample1 = new sample "hogehoge" in
  printf "%s\n" sample1#get_param;
  sample1#set_param "fuga";
  printf "%s\n" sample1#get_param
;;
