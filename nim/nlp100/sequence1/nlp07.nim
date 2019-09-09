import strutils, strformat

proc template_when(x, y, z: any): string =
  return fmt"{x}時の{y}は{z}"

echo template_when(12, "気温", 22.4)
