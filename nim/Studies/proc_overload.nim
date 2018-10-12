proc toString(x: int): int =
    result = x
    return
proc toString(x: bool): string =
    if x: result = "true"
    else: result = "false"

echo toString(13) # toString(x: int)プロシージャを呼び出す
echo toString(true) # toString(s: bool)プロシージャを呼び出す
