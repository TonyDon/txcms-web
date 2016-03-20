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
/**暂时通过siteurl区分GAME和INFO*/
SITE_MAIN.getNavUrl = function(su,id){
	var s =('/info/view?id='+id);
	if(su && su.indexOf('h5gfs')>=0){
		s = ('/h5g/show?id='+id);
	}
	return SITE_MAIN.getUrl(s);
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
	$.post(window.ctx + '/info/api/hit-viewnum.json', {'_method':'put', 'id':id});
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
			outSiteHref : $("a.site-url"),
			loveNav : $("a.love"),
			hateNav : $("a.hate")
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
	SITE_MAIN.jqObj.loveNav.find('span.zan-count').text(SITE_MAIN.infoDat.infoBase.loveNum);
	SITE_MAIN.jqObj.hateNav.find('span.cai-count').text(SITE_MAIN.infoDat.infoBase.hateNum);
	SITE_MAIN.jqObj.loveNav.data('id', SITE_MAIN.infoDat.infoBase.id);
	SITE_MAIN.jqObj.hateNav.data('id', SITE_MAIN.infoDat.infoBase.id);
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
		$.getScript("http://v2.uyan.cc/code/uyan.js?uid=2088046&_t="+Math.random());
	}
};

/** site latest list */
SITE_MAIN.NAV={};
SITE_MAIN.NAV.currPage=1;
SITE_MAIN.NAV.LATEST={};
SITE_MAIN.NAV.LATEST.doInit = function(){
	SITE_MAIN.jqObj={
				infoList:$('div.info-list'),
				navNextBtn : $('a.nav-next')
	};
	SITE_MAIN.jqObj.navNextBtn.on('click', function(){
		SITE_MAIN.NAV.fetchLatest();
	});
};
SITE_MAIN.NAV.LATEST.loveClick=function(target){
		var that = $(target);
	    var clicked = that.data('clicked');
	    if(!clicked){
	    	that.data('clicked', 1);
			var id = that.data('id');
			var param ={'id':id, 'mood':'love', '_method':'put'};
			$.post(window.ctx + '/info/api/post-mood.json', param, function(){
				var zan = that.find('span.zan-count');
				var zanCnt = parseInt(zan.text());
				zan.text(String(zanCnt+1));
			});
	    }
};
SITE_MAIN.NAV.LATEST.hateClick=function(target){
	var that = $(target);
    var clicked = that.data('clicked');
    if(!clicked){
    	that.data('clicked', 1);
		var id = that.data('id');
		var param ={'id':id, 'mood':'hate', '_method':'put'};
		that.unbind('click');
		$.post(window.ctx + '/info/api/post-mood.json', param, function(){
			var cai = that.find('span.cai-count');
			var caiCnt = parseInt(cai.text());
			cai.text(String(caiCnt+1));
		});
    }
};
SITE_MAIN.NAV.LATEST.viewAllClick=function(target){
	var that = $(target);
	var id = that.data('id');
	var cent = $('#content'+id);
	var isView = that.data('view');
	var isOpen = that.data('opened');
	if(!isView){
		var param ={'id':id,'flag':'content'};
		$.get(window.ctx + '/info/api/view-cont.json', param, function(x){
			that.data('view', 1);
			that.data('opened', true);
			that.html('收起 <span>∧</span>');
			if(x.infoConent){
				cent.html(x.infoConent.content);
				cent.find('img').addClass('img-responsive center-block');
			}
		});
		return ;
	}
	if(isOpen){
		that.data('opened', false);
		cent.removeClass('show').addClass('hidden');
		that.html('看全文 <span>&#969;</span>');
	}else if(!isOpen){
		that.data('opened', true);
		cent.removeClass('hidden').addClass('show');
		that.html('收起 <span>∧</span>');
	}
};
SITE_MAIN.NAV.LATEST.talkClick=function(target){
	var that = $(target);
	var id = that.data('id');
	var su = that.data('su');
	location.href= SITE_MAIN.getNavUrl(su, id)+'#uyan';
};
SITE_MAIN.NAV.fetchLatest = function(){
	var param = {'pageNo':SITE_MAIN.NAV.currPage, 'listSize':12};
	SITE_MAIN.jqObj.navNextBtn.text('努力加载中...');
	$.get(window.ctx + '/info/api/fetch-latest.json', param, function(x){
		if(x.pageDTO.datas && x.pageDTO.datas.length>0){
			SITE_MAIN.jqObj.infoList.append(template("infoBoxTpl", x.pageDTO));
			SITE_MAIN.NAV.currPage++;
			SITE_MAIN.jqObj.navNextBtn.text('∞ 点我继续 :-D');
		}else{
			//隐藏  next 加载按钮
			SITE_MAIN.jqObj.navNextBtn.unbind('click');
			SITE_MAIN.jqObj.navNextBtn.text('wow！到底了,小编正在编辑中...').delay(2000).fadeOut();
		}
	});
};
