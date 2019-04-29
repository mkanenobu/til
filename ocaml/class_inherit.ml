class sample x =
  object
    val mutable n = x
    method get_n = n
    method set_n x = n <- x
    method print = Printf.printf "%d\n" n
  end
;;

class inherited x =
  object
    inherit sample x
  end
;;

let () =
  let inherited_class = new inherited 10 in
  inherited_class#print;
  inherited_class#set_n 5;
  inherited_class#print;

