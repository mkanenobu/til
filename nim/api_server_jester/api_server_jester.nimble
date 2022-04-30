# Package

version       = "0.1.0"
author        = "mkanenobu"
description   = "API server example"
license       = "MIT"
srcDir        = "src"
bin           = @["api_server_jester"]


# Dependencies

requires "nim >= 1.6.4"
requires "jester >= 0.5.0"
requires "dotenv >= 2.0.0"
