(* 他のファイルから参照する場合は、ファイル名(capitalize).Sample になる *)
module Sample = struct
  let hello = print_endline "Hello, World!"
end

let () =
  Sample.hello;
