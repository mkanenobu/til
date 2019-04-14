(* tuple (object) *)
type person = {name: string; age: int}

let print_person person' =
  Printf.printf "name: %s\n" person'.name;
  Printf.printf "age: %d\n" person'.age


let () =
  let joseph = {name = "Joseph Cooper"; age = 34} in
  Printf.printf "name: %s\n" (joseph.name);
  Printf.printf "age: %d\n" (joseph.age);

  let amelia = {name = "Amelia Brand"; age = 28} in
  print_person amelia;
