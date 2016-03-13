var SITE_MAIN = {};
SITE_MAIN.getUrl = function(url){
	if(!url){
		return 'https://img.alicdn.com/imgextra/i2/152137799/T2jXVgXgdOXXXXXXXX_!!152137799.gif';
	}
	if(url.indexOf('http')!==0 && url.indexOf(window.ctx)<0){
		return window.ctx + url ;
	}
	return url ;
};
SITE_MAIN.existError = function(){
	if(SITE_MAIN.verrors && SITE_MAIN.verrors.length>0){
		alert('读取出错,请稍后再试! \r\n ' + SITE_MAIN.verrors.join('\r\n'));
		return true;
	}
	return false;
};
SITE_MAIN.fixArtImage = function(){
	$('div#main article img').addClass('img-responsive center-block');
};
SITE_MAIN.doHit = function(id){
	$.post(window.ctx + '/info/viewnum/hit.json', {'_method':'put', 'id':id});
};
SITE_MAIN.loadPage = function(PAGE_DATA, func){
	SITE_MAIN.infoDat = PAGE_DATA.infoDat || {};
	SITE_MAIN.verrors = PAGE_DATA.verrors ;
	if(SITE_MAIN.infoDat.infoBase){
		SITE_MAIN.pageId = SITE_MAIN.infoDat.infoBase.id;
	}else{
		SITE_MAIN.pageId = $('title').text().substring(0,12);
	}
	if(typeof(func)=='function'){
		func(SITE_MAIN);
	}
};
SITE_MAIN.initPageJqObj = function(){
	SITE_MAIN.jqObj = {
			artTitle : $("h3.title"),
			artTime : $("span.time"),
			artReadNum : $("span.read-num"),
			artAuthor : $("span.author"),
			artSummary : $("blockquote.summary"),
			artContent : $("div#main article"),
			artPicDir : $('div.main-pic'),
			artMainPic : $("div.main-pic img"),
			outSiteHref : $("a.site-url")
	};
};

/* info Page **/
SITE_MAIN.INFO={};
SITE_MAIN.INFO.doInit = function(){
	SITE_MAIN.initPageJqObj();
};
SITE_MAIN.INFO.doRender = function(){
	if(SITE_MAIN.existError())return ;
	SITE_MAIN.jqObj.artTitle.text(SITE_MAIN.infoDat.infoBase.title);
	SITE_MAIN.jqObj.artTime.text(ut.parseDate(SITE_MAIN.infoDat.infoBase.createTime, 10));
	SITE_MAIN.jqObj.artReadNum.text('阅读：'+SITE_MAIN.infoDat.infoBase.viewNum+'次');
	SITE_MAIN.jqObj.artAuthor.text('['+SITE_MAIN.infoDat.infoBase.authorId+']');
	SITE_MAIN.jqObj.artSummary.text(SITE_MAIN.infoDat.infoBase.summary);
	if(SITE_MAIN.infoDat.infoBase.hasPic===1){
		var picurl = SITE_MAIN.getUrl(SITE_MAIN.infoDat.infoBase.picUrl);
		if(picurl!=''){
			SITE_MAIN.jqObj.artMainPic.attr('src', picurl);
			SITE_MAIN.jqObj.artPicDir.show();
		}
	}
	if(SITE_MAIN.infoDat.infoBase.siteUrl && SITE_MAIN.infoDat.infoBase.siteUrl.length>5){
		var siteurl = SITE_MAIN.getUrl(SITE_MAIN.infoDat.infoBase.siteUrl);
		if(siteurl!=''){
			SITE_MAIN.jqObj.outSiteHref.attr('href', siteurl);
			SITE_MAIN.jqObj.outSiteHref.show();
		}
	}
	if(SITE_MAIN.infoDat.infoContent && SITE_MAIN.infoDat.infoContent.content){
		setTimeout(function(){
			SITE_MAIN.jqObj.artContent.html(SITE_MAIN.infoDat.infoContent.content);
			SITE_MAIN.fixArtImage();
		},ut.rndint(1000,2000));
	}
	SITE_MAIN.doHit(SITE_MAIN.infoDat.infoBase.id);
};


/* h5g page */
SITE_MAIN.H5G={};
SITE_MAIN.H5G.doInit = function(){
	SITE_MAIN.initPageJqObj();
	SITE_MAIN.jqObj.playBtn=$('#playBtn');
};
SITE_MAIN.H5G.configPlayBtn = function(){
	SITE_MAIN.jqObj.playBtn.on('click', function(){
		location.href = window.ctx + '/h5g/play?id=' + SITE_MAIN.infoDat.infoBase.id + '&t=' + Math.random() * 1000;
	});
};
SITE_MAIN.H5G.doRender = function(){
	if(SITE_MAIN.existError())return ;
	SITE_MAIN.jqObj.artTitle.text(SITE_MAIN.infoDat.infoBase.title);
	SITE_MAIN.jqObj.artTime.text(ut.parseDate(SITE_MAIN.infoDat.infoBase.createTime, 10));
	SITE_MAIN.jqObj.artReadNum.text('有'+SITE_MAIN.infoDat.infoBase.viewNum+'人玩过');
	SITE_MAIN.jqObj.artAuthor.text('['+SITE_MAIN.infoDat.infoBase.authorId+']');
	SITE_MAIN.jqObj.artSummary.text(SITE_MAIN.infoDat.infoBase.summary);
	if(SITE_MAIN.infoDat.infoBase.hasPic===1){
		var picurl = SITE_MAIN.getUrl(SITE_MAIN.infoDat.infoBase.picUrl);
		if(picurl!=''){
			SITE_MAIN.jqObj.artMainPic.attr('src', picurl);
			SITE_MAIN.jqObj.artPicDir.show();
		}
	}
	if(SITE_MAIN.infoDat.infoBase.siteUrl && SITE_MAIN.infoDat.infoBase.siteUrl.length>5){
		var siteurl = SITE_MAIN.getUrl(SITE_MAIN.infoDat.infoBase.siteUrl);
		if(siteurl!=''){
			SITE_MAIN.H5G.configPlayBtn();
		}
	}
	if(SITE_MAIN.infoDat.infoContent && SITE_MAIN.infoDat.infoContent.content){
		setTimeout(function(){
			SITE_MAIN.jqObj.artContent.html(SITE_MAIN.infoDat.infoContent.content);
			SITE_MAIN.fixArtImage();
		},ut.rndint(1000,2000));
	}
	SITE_MAIN.doHit(SITE_MAIN.infoDat.infoBase.id);
};

/*h5g play page**/
SITE_MAIN.H5G_PLAY={};
SITE_MAIN.H5G_PLAY.doInit = function(){
	SITE_MAIN.jqObj={
			h5gIframe:$('#h5gIframe')
	};
};
SITE_MAIN.H5G_PLAY.doRender = function(){
	if(SITE_MAIN.existError())return ;
	if(SITE_MAIN.infoDat.infoBase.siteUrl && SITE_MAIN.infoDat.infoBase.siteUrl.length>5){
		var siteurl = SITE_MAIN.getUrl(SITE_MAIN.infoDat.infoBase.siteUrl);
		if(siteurl!=''){
			var height = $(window).height() + $(window).scrollTop();
			SITE_MAIN.jqObj.h5gIframe.css({'height' : (parseInt(height/16)+1.5)+'em'});
			SITE_MAIN.jqObj.h5gIframe.load(function(){
				var thisheight = $(this).contents().find("body").height()+32;
				$(this).height(thisheight < 500 ? 500 : thisheight);
			});
			SITE_MAIN.jqObj.h5gIframe.attr('src', siteurl + 'index.html?T=' + Math.random() * 1000 + '&frwahash=' + SITE_MAIN.frwahash);
		}
		SITE_MAIN.doHit(SITE_MAIN.infoDat.infoBase.id);
	}
};

/*uyan comment**/
SITE_MAIN.UYAN ={}
var uyan_config;
SITE_MAIN.UYAN.doInit = function(pageId){
	if(pageId){
		SITE_MAIN.UYAN.config = {
			     'su':pageId
		};
		uyan_config = SITE_MAIN.UYAN.config;
		$.getScript("http://v2.uyan.cc/code/uyan.js?uid=2088046");
	}
};

