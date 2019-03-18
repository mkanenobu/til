type Literal = "sample" | "sample2"

function echoSample(): Literal {
  return "sample"
}

console.log(echoSample().replace("sam", "tam"))
