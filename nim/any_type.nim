import strformat
proc any_type(x, y: any): string =
  return fmt"arguments are {x} and {y}"

echo any_type(12, "string")

