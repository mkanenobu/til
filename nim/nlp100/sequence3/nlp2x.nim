import sequtils, strutils, nre, options, tables
import json
import source_file

let jsonNodes: seq[JsonNode] = fileString.split('\n').filterIt(it != "").mapIt(it.parseJson)

let
  englang = jsonNodes.filterIt(it["title"].getStr == "イギリス")[0]
  englandText = englang["text"].getStr

# nlp20
# echo englandText

# nlp21
var categories: seq[string]
for line in englandText.splitLines:
  if line.contains(re"\[\[Category:"):
    categories.add(line)

# echo categories.join("\n")

# nlp22
var categoryNames: seq[string]
for category in categories:
  let res = category.find(re"\[\[Category:(?<categoryName>.*?)(\|\*|\|.*|)\]\]")
  if res.isSome:
    categoryNames.add res.get.captures["categoryName"]

# echo categoryNames.join("\n")

# nlp23
var sections = initTable[string, int]()
for line in englandText.splitLines:
  let res = line.match(re"(?<level>=+)(?<sectionName>.*?)=+")
  if res.isSome:
    sections[res.get.captures["sectionName"]] = res.get.captures["level"].len - 1

# echo sections

# nlp24
var referencedFile: seq[string]
for line in englandText.splitLines:
  let res = line.find(re"\[\[(ファイル|File):(?<filename>.*?)[\||].*\]\]")
  if res.isSome:
    referencedFile.add(res.get.captures["filename"])

# echo referencedFile.join("\n")

# nlp25
var templates = initTable[string, string]


# nlp26

