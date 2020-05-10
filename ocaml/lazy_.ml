let lazy_type x = lazy x
let () = Printf.printf "%s\n" @@ Lazy.force_val (lazy_type "string")
