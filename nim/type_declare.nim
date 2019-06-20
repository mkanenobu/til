import unicode

type
  # object
  SampleObj = ref object of RootObj
    id: int
    name: string
  # enum
  SampleEnum {.pure.} = enum
    One
    Two
    Three
  EnumHasValue {.pure.} = enum
    One = "1"
    Two = "2"
    Three = "3"

echo SampleEnum.One
echo EnumHasValue.One
