import json, yaml, yaml/tojson

const sampleYaml = """
header:
  first:
    - element one
  second:
    - element two
"""

let converted: seq[JsonNode] = loadToJson(sampleYaml)
echo converted
