// japanese to english
(function() {
  var text = window.getSelection();
  var url = "https://translate.google.co.jp/?hl=ja#view=home&op=translate&sl=ja&tl=en&text=" + text;
  window.open(url);
})();

// english to japanese
(function() {
  var text = window.getSelection();
  var url = "https://translate.google.co.jp/?hl=ja#view=home&op=translate&sl=en&tl=ja&text=" + text;
  window.open(url);
})();

// if selected string starts alphanumeric, translate to japanese, else translate to english
(function() {
  var text = window.getSelection().toString().replace(/\n/g, '%250A');
  if (text.search(/^\w/) === 0) {
    var url = "https://translate.google.co.jp/?hl=ja#view=home&op=translate&sl=en&tl=ja&text=";
  } else {
    var url = "https://translate.google.co.jp/?hl=ja#view=home&op=translate&sl=ja&tl=en&text=";
  }
  window.open(url + text);
})();
