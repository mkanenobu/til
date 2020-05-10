open Printf

(* exec command and capture output *)
let syscall cmd =
  let in_ch, out_ch = Unix.open_process cmd in
  let buffer = Buffer.create 16 in
  (try
     while true do
       Buffer.add_channel buffer in_ch 1
     done
   with
  | End_of_file -> ());
  ignore @@ Unix.close_process (in_ch, out_ch);
  Buffer.contents buffer
;;

let () =
  (* Sys.command return exit code *)
  printf "%d\n" (Sys.command "ls");
  print_endline "Exec command and capture output";
  let output = syscall "date" in
  print_endline "Output:";
  printf "%s\n" output
;;
