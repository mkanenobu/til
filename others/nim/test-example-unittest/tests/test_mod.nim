import "../src/mod.nim"
import unittest

suite "greet":
  test "greet with name":
    check greet("world") == "Hello, world!"
