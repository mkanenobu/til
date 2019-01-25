var template = Hogan.compile($('#template').text())
var data = [
  {
    'word': 'SWAP',
    'annotation': '( x1 x2 -- x2 x1 )',
    'desc': 'Exchange the top two stack items.'
  },
  {
    'word': 'DUP',
    'annotation': '( x -- x x )',
    'desc': 'Duplicate x.'
  }
]

var rend = template.render({data: data})

document.body.innerHTML = rend
