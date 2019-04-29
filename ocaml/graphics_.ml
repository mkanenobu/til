open Graphics

let () =
  open_graph " 640x480";
  for i = 12 downto 1 do
    let radius = i * 20 in
    print_endline ("radius is " ^ string_of_int radius);
    set_color (if i mod 2 = 0 then green else red);
    fill_circle 320 240 radius;
    Unix.sleep 1;
  done;

