import gleam/io
import gleam/bit_array
import gleam/result
import gleam/list

// gleamのファイルモジュールは提供されているが
pub fn file_example() {
  use cwd <- result.try(get_cwd())
  cwd
  |> io.debug

  list_dir_all(cwd) |> io.debug

  let path = cwd <> "/" <> "gleam.toml"
  let r = read_file(path)
  case r {
    Ok(content) -> {
      content |> io.debug
      Nil
    }
    Error(err) -> {
      io.debug("Error reading file")
      io.debug(err)
    }
  }

  Ok(Nil)
}

@external(erlang, "file", "read_file")
fn read_file_native(path: String) -> Result(String, Nil)
fn read_file(path: String) -> Result(String, Nil) {
  use content <- result.try(read_file_native(path))
  Ok(content)
}

@external(erlang, "file", "get_cwd")
fn get_cwd_native() -> Result(List(BitArray), err)

fn get_cwd() -> Result(String, Nil) {
  use cwd <- result.try(get_cwd_native())
  cwd
  |> bit_array.concat
  |> bit_array.to_string
}

@external(erlang, "file", "list_dir_all")
fn list_dir_all_native(path: String) -> Result(List(List(BitArray)), err)

fn list_dir_all(path: String) -> Result(List(String), Nil) {
  use result <- result.try(list_dir_all_native(path))
  result
  |> list.map(fn(filename) {
    let r =
      filename
      |> bit_array.concat
      |> bit_array.to_string

    let assert Ok(r) = r
    r
  })
  |> Ok
}
