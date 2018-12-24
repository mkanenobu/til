(window.onload = function() {
  var elm = document.getElementsByTagName("h1")[0];
  elm.insertAdjacentHTML('beforeend', document.title);

  var header = document.getElementsByTagName("header")[0];
  var filename = location.href.split('/').pop();
});
