(function() {
  let c = window.getSelection().toString();
  if (c == ""){
    c = window.prompt("Input character.", "");
  }
  let a = [];
  for (let i of c) {
    a.push(i.charCodeAt());
  }
  alert(a);
})();
