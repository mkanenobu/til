open Printf

let fizzbuzz n =
  for i = 1 to n do
    match i with
    | _ when i mod 15 = 0 -> printf "FizzBuzz\n"
    | _ when i mod 5 = 0 -> printf "Buzz\n"
    | _ when i mod 3 = 0 -> printf "Fizz\n"
    | _ -> printf "%d\n" i
  done

(* tail recurtion *)
let fizzbuzz2 n =
  let rec iter i =
    let _ = match i with
      | _ when i mod 15 = 0 -> printf "FizzBuzz\n"
      | _ when i mod 5 = 0 -> printf "Buzz\n"
      | _ when i mod 3 = 0 -> printf "Fizz\n"
      | _ -> printf "%d\n" i in
    if i < n then iter (i + 1)
  in
  iter 1
;;

let fizzbuzz3 n =
  let l = List.tl (List.init n (fun e -> e)) in
  List.iter (fun e ->
      begin
        if e mod 15 = 0 then printf "FizzBuzz\n"
        else if e mod 5 = 0 then printf "Buzz\n"
        else if e mod 3 = 0 then printf "Fizz\n"
        else printf "%d\n" e
      end
    ) l
;;

let () =
  fizzbuzz 20;
  fizzbuzz2 20;
  fizzbuzz3 20;
