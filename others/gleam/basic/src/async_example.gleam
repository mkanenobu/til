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
  task.async(fn() {
    tarai(x, y, z)
  })
}

fn tarai(x: Int, y: Int, z: Int) -> Int {
  case x <= y {
    True -> y
    False ->
      tarai(
        tarai(x - 1, y, z),
        tarai(y - 1, z, x),
        tarai(z - 1, x, y)
      )
  }
}