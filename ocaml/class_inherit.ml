class sample1 x =
  object
    val mutable n = x

    method get_n = n

    method set_n x = n <- x

    method print = Printf.printf "%d\n" n
  end

class sample2 =
  object
    method print = Printf.printf "sample2"
  end

class inherited x =
  object
    (* 同名のメソッドを持つクラスを多重継承した場合後勝ち *)
    (* スーパークラスの参照名を定義すればクラスを指定してメソッド呼び出し可能 *)
    inherit sample1 x as super1

    inherit sample2

    (* 本来sample2のprintがinheritedのprintメソッドになるが
       sample1のprintでオーバーライド *)
    method print = super1#print
  end

let () =
  let inherited_class = new inherited 10 in
  inherited_class#print;
  inherited_class#set_n 5;
  inherited_class#print
;;
