/*
一番近い親のidを取得
URL#id の文字列をクリップボードにコピー
*/

// nodeを遡りながらidが存在するelementがあればそのidを返す
const wholeSearchId = (node) => {
  const id = node.id
  if (id !== '' && typeof id !== 'undefined') {
    return id
  } else if (id == null) {
    return
  } else {
    return wholeSearchId(node.parentNode)
  }
}

(function() {
  const url = location.href
  const selected = window.getSelection()
  if (selected == '') {
    return
  }
  const id = selected.baseNode.parentNode.id
  if (id == '' || id == null) {
    return
  }

  alert(url + '#' + id)
})()
