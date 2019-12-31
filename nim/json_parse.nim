import json

let jsonNode = parseJson("""{
  "first": 3.14,
  "second": 100,
  "third": "String",
}""")

echo jsonNode["second"].getInt() # get as type
echo jsonNode["second"].getFloat()

var
  name = "John"
  age = 41

# create json node
var jsonObj: JsonNode = %*[
  { "name": name, "age": 30 },
  { "name": "Marry", "age": age },
]
# stringify
echo $jsonObj

var jsonObj2 = %* {"name": "Isaac", "books": ["Robot Dreams"]}
# same value, different order
var jsonObj3 = %* {"books": ["Robot Dreams"], "name": "Isaac" }
echo jsonObj2 == jsonObj3

