(function() {
	 var cid = 0;
	 if(PAGE_DATA.infoDat.infoBase){
		 cid = PAGE_DATA.infoDat.infoBase.catId;
	 }
	 if(cid && (cid>=46 && cid<=50)){ //stop ggadsense
		 return ;
	 }
     var s = document.createElement('script');
     s.type = 'text/javascript';
     s.async = true;
     s.src = '//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js';
     var x = document.getElementsByTagName('script')[0];
     x.parentNode.insertBefore(s, x);
 })();
(adsbygoogle = window.adsbygoogle || []).push({});