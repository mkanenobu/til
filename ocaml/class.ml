class stack_of_int =
  object (self)
    (* インスタンス変数 *)
    val mutable list_ = ([] : int list)
    method push x =
      (* <- は割り当て演算子 *)
      (* 変更可能なインスタンス変数の更新に用いる *)
      list_ <- x :: list_
    method pop =
      let result = List.hd list_ in
      list_ <- List.tl list_;
      result
    method peek =
      List.hd list_
    method size =
      List.length list_
  end
;;

class ['a] stack =
  object (self)
    val mutable list_ = ([]: 'a list)
    method push x =
      list_ <- x :: list_
    method pop =
      let result List.hd list_ in
      list_ <- List.tl list_;
      result
    method peek =
      List.hd list
    method size =
      List.length list_
  end;;

let () =
  let s = new stack_of_int in
  for i = 1 to 10 do
    s#push i
  done;

  while s#size > 0 do
    Printf.printf "Popped %d off from the stack_of_int\n" s#pop
  done;
