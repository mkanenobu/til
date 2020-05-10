open Core

let rec gcd (n, m) = if m = 0 then n else gcd (m, n mod m)
let () = printf "%d\n" @@ gcd (10, 4)
