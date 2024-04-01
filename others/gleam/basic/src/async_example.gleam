import gleam/otp/task
import gleam/io
import gleam/int

pub fn async_example() {
  let _ = async_task_example()

  Nil
}

fn async_task_example() {
  let wait_millisec = int.random(2000)
  io.debug("wait milliseconds: " <> int.to_string(wait_millisec))

  spawn_task(14, 8, 0)
  |> task.try_await(wait_millisec)
  |> io.debug
}

fn spawn_task(x: Int, y: Int, z: Int) -> task.Task(Int) {
  task.async(fn() { tarai(x, y, z) })
}

fn tarai(x: Int, y: Int, z: Int) -> Int {
  case x <= y {
    True -> y
    False -> tarai(tarai(x - 1, y, z), tarai(y - 1, z, x), tarai(z - 1, x, y))
  }
}
// fn race_example() {
//   let a_wait = int.random(1000)
//   let b_wait = int.random(1000)
//   io.debug("a wait: " <> int.to_string(a_wait))
//   io.debug("b wait: " <> int.to_string(b_wait))

//   let task_a = task.async(fn() { sleep(a_wait) })
//   let task_b = task.async(fn() { sleep(b_wait) })
// }

// @external(erlang, "timer", "sleep")
// fn sleep(millisec: Int) -> Nil
