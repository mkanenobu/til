import gleam/io
import gleam/otp/actor
import gleam/erlang/process

pub fn actor_example() {
  let assert Ok(actor) = actor.start([], handle_message)

  process.send(actor, Push("first"))
  process.send(actor, Push("second"))
  process.send(actor, Push("last"))

  process.send(actor, ShowStack)
  let assert Ok(last) = process.call(actor, Pop, 10)
  let assert Ok(second) = process.call(actor, Pop, 10)
  let assert Ok(first) = process.call(actor, Pop, 10)
  io.println("last: " <> last)
  io.println("second: " <> second)
  io.println("first: " <> first)

  let assert Error(Nil) = process.call(actor, Pop, 10)

  process.send(actor, Shutdown)
}

pub type Message(element) {
  Shutdown
  Push(push: element)
  Pop(reply_with: process.Subject(Result(element, Nil)))
  ShowStack
}

fn handle_message(
  message: Message(e),
  stack: List(e),
) -> actor.Next(Message(e), List(e)) {
  case message {
    Shutdown -> actor.Stop(process.Normal)
    ShowStack -> {
      io.print("stack: ")
      io.debug(stack)
      actor.continue(stack)
    }
    Push(value) -> {
      let new_state = [value, ..stack]
      actor.continue(new_state)
    }
    Pop(client) ->
      case stack {
        [] -> {
          process.send(client, Error(Nil))
          actor.continue([])
        }

        [first, ..rest] -> {
          process.send(client, Ok(first))
          actor.continue(rest)
        }
      }
  }
}
