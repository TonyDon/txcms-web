var SITE_MAIN = {};
SITE_MAIN.getUrl = function(url){
	if(!url){
		return '';
	}
	if(url.indexOf('http')!==0){
		if(/.*\/store\/.*/.test(url)){
			return 'http://s.986001.com'+window.ctx + url ;
		}
		return window.ctx + url ;
	}
	return url ;
};
/**暂时通过siteurl区分GAME和INFO*/
SITE_MAIN.getNavUrl = function(su,id){
	var s =('/info/'+id);
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
SITE_MAIN.fmtSummary = function(s){
	if(s && s.length>0){
		return s.replace(/\r\n/gi,'<br/>');
	}
	return s;
};
SITE_MAIN.isH5G = function(cid){
		return SITE_CAT_LIST['c'+cid] && SITE_CAT_LIST['c'+cid].catPath.indexOf('0-30-')!=-1;
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
			loveNav : $("a.love"),
			hateNav : $("a.hate"),
			randPick : $("a.rand-pick"),
			goPrev : $('a.prev'),
			goNext : $('a.next'),
			artMainVideo : $('div.main-video'),
			vplayer : $("#vplayer"),
			ifvplayer : $('#ifvplayer')
	};
};
SITE_MAIN.getCatNav=function(cid){
	if(!cid || !SITE_CAT_LIST){
		return '';
	}
	var c = 'c'+cid;
	var cat = SITE_CAT_LIST[c];
	var cp = cat.catPath;
	var cparr = cp.substring(2,cp.length-1).split('-');
	var na = [];
	for(var k in cparr){
		na.push(SITE_CAT_LIST['c'+cparr[k]].name);
	}
	return na.join('/');
};

/* info Page **/
SITE_MAIN.INFO={};
SITE_MAIN.INFO.doInit = function(){
	SITE_MAIN.initPageJqObj();
};
SITE_MAIN.INFO.doRender = function(){
	if(SITE_MAIN.existError())return ;
	var ib = SITE_MAIN.infoDat.infoBase;
	var iid = ib.id;
	var jqO = SITE_MAIN.jqObj;
	jqO.artTitle.text(ib.title);
	jqO.artReadNum.text('浏览 '+ib.viewNum+'次');
	jqO.artAuthor.text('['+ib.authorId+']');
	jqO.loveNav.find('span.zan-count').text(ib.loveNum);
	jqO.hateNav.find('span.cai-count').text(ib.hateNum);
	jqO.loveNav.data('id', iid);
	jqO.hateNav.data('id', iid);
	jqO.randPick.data('id', iid);
	jqO.randPick.data('cid', ib.catId);
	jqO.goPrev.data('id', iid);
	jqO.goNext.data('id', iid);
	jqO.goPrev.data('cid', ib.catId);
	jqO.goNext.data('cid', ib.catId);
	jqO.artSummary.html(SITE_MAIN.fmtSummary(ib.summary));
	if(ib.hasPic===1 && ib.hasVideo!==1){
		var picurl = SITE_MAIN.getUrl(ib.picUrl);
		if(picurl!=''){
			jqO.artMainPic.attr('src', picurl);
			jqO.artPicDir.show();
		}
	}
	if(ib.hasVideo===1){
		var vurl = SITE_MAIN.getUrl(ib.videoUrl);
		var surl = SITE_MAIN.getUrl(ib.siteUrl);
		if(vurl!=''){ // 视频源地址存在则使用video播放
			jqO.vplayer.attr('src', vurl);
			jqO.vplayer.attr('preload', 'auto');
			var picurl = SITE_MAIN.getUrl(ib.picUrl);
			if(picurl!=''){
				jqO.vplayer.attr('poster', picurl);
			}
			jqO.vplayer.click(function(){
				var s = jqO.vplayer.data('s') || '0';
				if(s=='0'){
					this.play();
					jqO.vplayer.data('s','1');
				}else if(s=='1'){
					this.pause();
					jqO.vplayer.data('s','0');
				}
			});
			jqO.ifvplayer.hide();
			jqO.artMainVideo.show();
			
		}else if(surl!=''){ // 视频站点使用iframe站点嵌入播放
			jqO.vplayer.hide();
			jqO.ifvplayer.attr('src', surl);
			jqO.artMainVideo.show();
		}
	}
	if(SITE_MAIN.infoDat.infoContent && SITE_MAIN.infoDat.infoContent.content){
		setTimeout(function(){
			SITE_MAIN.jqObj.artContent.html(SITE_MAIN.infoDat.infoContent.content);
			SITE_MAIN.fixArtImage();
		},ut.rndint(1000,2000));
	}
	SITE_MAIN.doHit(iid);
};
SITE_MAIN.INFO.a1 = '驿站访客过多，请稍后再试哦~';
/* rand pick info */
SITE_MAIN.INFO.randPick = function(target){
	var that = $(target);
	var id = that.data('id');
	var cid = that.data('cid');
	var param ={'id':id,'rnd':ut.r(),'cid':cid,'s':location.href};
	$.get(window.ctx + '/info/api/rand-pick.json', param, function(x){
		if(x && x.id){
			if(SITE_MAIN.isH5G(cid)){
				location.href = window.ctx + '/h5g/show?id=' + x.id + '&fr=randpick&t=' + Math.random() * 1000;
			}else{
				location.href = window.ctx + '/info/' + x.id + '?fr=randpick&t=' + Math.random() * 1000;
			}
		}else{
			alert(SITE_MAIN.INFO.a1);
		}
	});
};
/* prev, next info*/
SITE_MAIN.INFO.go = function(target,flg){
	var that = $(target);
	var id = that.data('id');
	var cid = that.data('cid');
	var param ={'id':id,'rnd':ut.r(),'direct':flg,'cid':cid,'s':location.href};
	$.get(window.ctx + '/info/api/go-pick.json', param, function(x){
		if(x && x.id){
			if(SITE_MAIN.isH5G(cid)){
				location.href = window.ctx + '/h5g/show?id=' + x.id + '&fr=gopick&t=' + Math.random() * 1000;
			}else{
				location.href = window.ctx + '/info/' + x.id + '?fr=gopick&t=' + Math.random() * 1000;
			}
		}else{
			alert(SITE_MAIN.INFO.a1);
		}
	});
}

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
	var ib = SITE_MAIN.infoDat.infoBase;
	var iid = ib.id;
	var jqO = SITE_MAIN.jqObj;
	jqO.artTitle.text(ib.title);
	jqO.artReadNum.text('有'+ib.viewNum+'人玩过');
	jqO.artAuthor.text('['+ib.authorId+']');
	jqO.artSummary.text(ib.summary);
	jqO.loveNav.find('span.zan-count').text(ib.loveNum);
	jqO.hateNav.find('span.cai-count').text(ib.hateNum);
	jqO.loveNav.data('id', iid);
	jqO.hateNav.data('id', iid);
	jqO.randPick.data('id', iid);
	jqO.randPick.data('cid', ib.catId);
	jqO.goPrev.data('id', iid);
	jqO.goNext.data('id', iid);
	jqO.goPrev.data('cid', ib.catId);
	jqO.goNext.data('cid', ib.catId);
	if(ib.hasPic===1){
		var picurl = SITE_MAIN.getUrl(ib.picUrl);
		if(picurl!=''){
			jqO.artMainPic.attr('src', picurl);
			jqO.artPicDir.show();
		}
	}
	if(ib.siteUrl && ib.siteUrl.length>5){
		var siteurl = SITE_MAIN.getUrl(ib.siteUrl);
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
	SITE_MAIN.doHit(iid);
};

/*h5g play page**/
SITE_MAIN.H5G_PLAY={};
SITE_MAIN.H5G_PLAY.doInit = function(){
	SITE_MAIN.initPageJqObj();
	SITE_MAIN.jqObj.h5gIframe = $('#h5gIframe');
};
SITE_MAIN.H5G_PLAY.doRender = function(){
	if(SITE_MAIN.existError())return ;
	var ib = SITE_MAIN.infoDat.infoBase;
	var iid = ib.id;
	var jqO = SITE_MAIN.jqObj;
	jqO.artSummary.html(ib.title+'<br/>'+ib.summary);
	jqO.loveNav.find('span.zan-count').text(ib.loveNum);
	jqO.hateNav.find('span.cai-count').text(ib.hateNum);
	jqO.loveNav.data('id', iid);
	jqO.hateNav.data('id', iid);
	jqO.randPick.data('id', iid);
	jqO.randPick.data('cid', ib.catId);
	jqO.goPrev.data('id', iid);
	jqO.goNext.data('id', iid);
	jqO.goPrev.data('cid', ib.catId);
	jqO.goNext.data('cid', ib.catId);
	if(ib.siteUrl && ib.siteUrl.length>5){
		var siteurl = SITE_MAIN.getUrl(ib.siteUrl);
		if(siteurl!=''){
			var height = $(window).height() + $(window).scrollTop();
			jqO.h5gIframe.css({'height' : (parseInt(height/16)+1.5)+'em'});
			jqO.h5gIframe.load(function(){
				var thisheight = $(this).contents().find("body").height()+32;
				$(this).height(thisheight < 500 ? 500 : thisheight);
			});
			jqO.h5gIframe.attr('src', siteurl + 'index.html?T=' + Math.random() * 1000 + '&frwahash=' + SITE_MAIN.frwahash);
		}
		SITE_MAIN.doHit(ib.id);
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
/**baidu share*/
SITE_MAIN.BDSHARE={};
SITE_MAIN.BDSHARE.doInit = function(){
	window._bd_share_config = {
		"common" : {
			"bdSnsKey" : {},
			"bdText" : "",
			"bdMini" : "2",
			"bdMiniList" : [ "weixin", "tqq", "bdxc", "tieba", "sqq",
					"diandian", "huaban", "people", "mail", "isohu", "copy" ],
			"bdPic" : "",
			"bdStyle" : "1",
			"bdSize" : "24"
		},
		"share" : {},
		"image" : {
			"viewList" : [ "qzone", "weixin", "tsina", "tqq", "sqq" ],
			"viewText" : "分享到：",
			"viewSize" : "24"
		},
		"selectShare" : {
			"bdContainerClass" : null,
			"bdSelectMiniList" : [ "qzone", "weixin", "tsina", "tqq", "sqq" ]
		}
	};
	$.getScript('http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5));
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
	SITE_MAIN.NAV.fetchLatest();
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
		$.post(window.ctx + '/info/api/post-mood.json', param, function(){
			var cai = that.find('span.cai-count');
			var caiCnt = parseInt(cai.text());
			cai.text(String(caiCnt+1));
		});
    }
};
SITE_MAIN.NAV.LATEST.h5gPlayClick=function(target){
	var that = $(target);
	location.href= window.ctx + '/h5g/play?id=' + that.data('id') + '&t=' + ut.r();
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
		that.html('看全文');
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
	var param = {'pageNo':SITE_MAIN.NAV.currPage, 'listSize':16};
	var jqO = SITE_MAIN.jqObj;
	jqO.navNextBtn.text('努力加载中...');
	$.get(window.ctx + '/info/api/fetch-latest.json', param, function(x){
		if(x.pageDTO.datas && x.pageDTO.datas.length>0){
			jqO.infoList.append(template("infoBoxTpl", x.pageDTO));
			SITE_MAIN.NAV.currPage++;
			jqO.navNextBtn.text('点我继续');
		}else{
			//隐藏  next 加载按钮
			jqO.navNextBtn.off('click');
			jqO.navNextBtn.text('到底了,看看其他的吧...').delay(2000).fadeOut();
		}
	});
};
SITE_MAIN.NAV.fetchByCat = function(cid, fn){
	var param = {'pageNo':SITE_MAIN.NAV.currPage, 'listSize':16, 'catId':cid};
	var jqO = SITE_MAIN.jqObj;
	jqO.navNextBtn.text('努力加载中...');
	$.get(window.ctx + '/info/api/fetch-cat-list.json', param, function(x){
		if(x.pageDTO && x.pageDTO.datas && x.pageDTO.datas.length>0){
			jqO.infoList.append(template("infoBoxTpl", x.pageDTO));
			SITE_MAIN.NAV.currPage++;
			jqO.navNextBtn.text('点我继续 ');
			if(typeof fn === "function"){
				fn();
			}
		}else{
			//隐藏  next 加载按钮
			jqO.navNextBtn.off('click');
			jqO.navNextBtn.text('到底了,小编忙碌中...').delay(2000).fadeOut();
		}
	});
};
SITE_MAIN.NAV.CAT={};
SITE_MAIN.NAV.CAT.doInit = function(cid, fn){
	SITE_MAIN.jqObj={
				infoList:$('div.info-list'),
				navNextBtn : $('a.nav-next')
	};
	SITE_MAIN.jqObj.navNextBtn.on('click', function(){
		SITE_MAIN.NAV.fetchByCat(cid, fn);
	});
	SITE_MAIN.NAV.fetchByCat(cid, fn);
};
