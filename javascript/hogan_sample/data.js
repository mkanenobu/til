var user_template = document.getElementById("template").innerHTML
var template = Hogan.compile(user_template)

var data = [
  {
    'word': 'SWAP',
    'annotation': '( x1 x2 -- x2 x1 )',
    'desc': 'Exchange the top two stack items.',
  },
  {
    'word': 'DUP',
    'annotation': '( x -- x x )',
    'desc': 'Duplicate x.'
  },
  {
    'word': 'WHILE',
    'interpretation': 'Interpretation semantics for this word are undefined.',
    'compilation-annotation': '( C: dest -- orig dest )',
    'compilation': 'Put the location of a new unresolved forward reference orig onto the control flow stack, under the existing dest. Append the run-time semantics given below to the current definition. The semantics are incomplete until orig and dest are resolved (e.g., by REPEAT).',
    'runtime-annotation': '( x -- )',
    'runtime': 'If all bits of x are zero, continue execution at the location specified by the resolution of orig.'
  }
]

var rend = template.render({data: data})

document.body.innerHTML = rend
