
let l = [8; 7; 2; 4; 6; 9; 3; 5; 1]

let print_list xs =
  print_string "[";
  print_string (List.map string_of_int xs |> String.concat " ");
  print_string "]\n";
;;

(* buble sort O(n^2) *)
let rec bubble_sort l =
  let rec walk = function
    | x :: y :: xs when x > y -> y :: walk (x :: xs)
    | x :: xs -> x :: walk xs
    | xs -> xs
  in
  let l' = walk l in
  (* if same as previous, then return *)
  if  l <> l' then bubble_sort l'
  else l;
;;

(* selection sort O(n^2) *)
let rec selection_sort = function
  | [] -> []
  | x :: xs ->
    let rec select_r min' out = function
      | [] -> min' :: selection_sort out
      | x :: xs when x < min' -> select_r x (min' :: out) xs
      | x :: xs -> select_r min' (x :: out) xs
    in
    select_r x [] xs
;;

(* insertion sort O(n^2) *)
let rec insertion_sort l =
  let rec insert x l' =
    match l' with
    | [] -> [x]
    | y :: ys -> if x < y then x :: y :: ys else y :: insert x ys
  in
  match l with
  | [] -> []
  | x :: xs -> insert x (insertion_sort xs)
;;

let () =
  print_list @@ bubble_sort l;
  print_list @@ selection_sort l;
  print_list @@ insertion_sort l;

