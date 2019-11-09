open Core
open Re2

let read_file filepath =
  let ic = In_channel.create filepath in
  In_channel.input_all ic

(* ?????? *)
let csv_split_pattern = "(?:^|,)(?=[^\"]|(\")?)\"?((?(1)[^\"]*|[^,\"]*))\"?(?=,|$)"

class csv ?(header = true) () =
  object (self)
    val mutable all: string list = ([]: string list)
    val mutable header = header
    method header_exit b = header <- b
    method read_csv filepath =
      let raw_csv = read_file filepath in
      (* WIP *)
      raw_csv

    method get_header = if header
      then List.nth all 0
      else failwith "header option is false"
    method get_body = if header
      then List.tl all
      else Some all
    method get_nth_row n = List.nth all n
  end
