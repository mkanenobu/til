open Core

(* 型変数を使用した任意の型の値を格納できるスタッククラス *)
class ['a] stack =
  object(self)
    val mutable stack = ([]: 'a list)
    method push x = stack <- x :: stack
    method pop =
      let res = List.hd_exn stack in
      stack <- (
        match List.tl stack with
        | Some x -> x
        | None -> []
      );
      res
    method size = List.length stack
  end
;;

let () =
  let int_stack = new stack in
  int_stack#push 13;
  int_stack#push 1;
  printf "%d\n" int_stack#pop;
  printf "%d\n" int_stack#pop;

  let float_stack = new stack in
  float_stack#push 0.13;
  float_stack#push 3.14;
  printf "%F\n" float_stack#pop;
  printf "%F\n" float_stack#pop;
