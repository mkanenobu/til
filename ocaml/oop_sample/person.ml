open Core

class person =
  object (self)
    val mutable first_name = "John"
    val mutable last_name = "Doe"
    method set_first_name x = first_name <- x
    method set_last_name x = last_name <- x
    method get_fullname = sprintf "%s %s" first_name last_name
    method get_first_name = first_name
    method get_last_name = last_name
  end


let () =
  let john = new person in
  print_endline john#get_fullname;

  let bob = new person in
  bob#set_first_name "Bob";
  bob#set_last_name "Dylan";
  print_endline bob#get_fullname;

  let alice = new person in
  alice#set_first_name "Alice";
  alice#set_last_name "Liddell";
  print_endline alice#get_fullname;
