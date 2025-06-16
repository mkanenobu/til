using Random
using Printf

wait_random_time(p::Int) = begin
  wait_ms = 0.5 + (rand(1:9) / 10)
  sleep(wait_ms)
  return (p, wait_ms)
end

print_result(t) = begin
  @printf("n: %d, %0.1f ms waited\n", t[1], t[2])
end

# asyncは即時実行
# Juliaの現時点の実装ではasyncを使うとそのタスクと親タスクの実行スレッドを固定するので、
# マルチスレッドを使った並列実行が不要だとしてもライブラリではThread.@spawnを利用する方が望ましい
println("async")
promises = map(n -> begin
  return @async wait_random_time(n)
end, 0:2)

@time print_result.(fetch.(promises))

# taskはタスクを作るだけで実行せず、scheduleでキューイングする必要がある
println("\ntask")
tasks = map(n -> begin
  return @task wait_random_time(n)
end, 0:2)

schedule.(tasks)
@time print_result.(fetch.(tasks))

# spawnはasync, taskよりrawなAPI
println("\nspawn")
tasks = map(n -> begin
  return Threads.@spawn wait_random_time(n)
end, 0:2)

@time print_result.(fetch.(tasks))

println("")
n = 5
t = @async begin
  sleep(1)
  # $でクロージャに変数をキャプチャ出来る
  println("copy: ", $n)
  # キャプチャしない場合にはその時点の変数の値が使われる
  println("no-copy: ", n)
end
# 変数が利用される前に値を変更
n = 6
wait(t)
