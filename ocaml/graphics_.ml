open Graphics;;
open Unix;;

let () =
  open_graph "";
  set_window_title "OCaml Graphics sample";
  (* wait 1 seconds by 10 times *)
  for i = 0 to 100 do
    let x = i * 2 + 400 in
    let y = i * 1 + 400 in
    resize_window x y;
    sleepf 0.1;
  done;
  close_graph ();

