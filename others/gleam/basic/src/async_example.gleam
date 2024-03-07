import gleam/otp/task
import gleam/io
import gleam/int

pub fn async_example() {
  let _ = async_task_example()

  Nil
}

fn async_task_example() {
  let wait_seconds = int.random(3)
  io.debug("wait seconds: " <> int.to_string(wait_seconds))

  spawn_task(1, 2, wait_seconds)
  |> task.try_await(1)
  |> io.debug
}

fn spawn_task(a: Int, b: Int, wait_seconds: Int) -> task.Task(Int) {
  task.async(fn() {
    sleep(wait_seconds * 1000)

    a + b
  })
}

@external(erlang, "timer", "sleep")
fn sleep(milliseconds: Int) -> Nil
