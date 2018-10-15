javascript:
(function() {
    var url=location.href;
    var title=document.title;
    url=encodeURIComponent(url);
    title=encodeURIComponent(title);
    window.open('https://twitter.com/intent/tweet?url='+url+'&text='+title,'_blank');
})();
