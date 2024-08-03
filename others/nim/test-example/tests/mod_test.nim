from "../src/mod.nim" import greet

discard """
  exitcode: 0
"""
doAssert greet("World") == "Hello, World!"
