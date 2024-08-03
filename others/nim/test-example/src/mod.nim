import std/strformat

func greet*(name: string): string =
  return &"Hello, {name}!"
