
read_file(filename::String) = begin
  # read as String
  content = read(filename, String)
  println(content)

  # read as Bytes
  content = read(filename)
  println(content)

  # read by lines
  lc = 0
  for line in eachline(filename)
    lc += 1
    println(line)
  end
  println("line count: ", lc)

  # open file with block
  # ブロックから抜けた時点でクローズされる
  open(filename, "r") do f
    _content = read(f, String)
    println(_content)
    for _line in eachline(f)
    end
  end

  # open file and close
  f = open(filename)
  println(read(f, String))
  close(f)
end

read_file("./read_file.jl")
