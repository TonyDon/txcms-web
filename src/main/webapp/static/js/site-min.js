var SITE_MAIN={};SITE_MAIN.getUrl=function(a){if(!a){return"https://img.alicdn.com/imgextra/i2/152137799/T2jXVgXgdOXXXXXXXX_!!152137799.gif"}if(a.indexOf("http")!==0&&a.indexOf(window.ctx)<0){return window.ctx+a}return a};SITE_MAIN.getNavUrl=function(a,c){var b=("/info/view?id="+c);if(a&&a.indexOf("h5gfs")>=0){b=("/h5g/show?id="+c)}return SITE_MAIN.getUrl(b)};SITE_MAIN.existError=function(){if(SITE_MAIN.verrors&&SITE_MAIN.verrors.length>0){alert("\u8bfb\u53d6\u51fa\u9519,\u8bf7\u7a0d\u540e\u518d\u8bd5! \r\n "+SITE_MAIN.verrors.join("\r\n"));return true}return false};SITE_MAIN.fixArtImage=function(){$("div#main article img").addClass("img-responsive center-block")};SITE_MAIN.doHit=function(a){$.post(window.ctx+"/info/api/hit-viewnum.json",{_method:"put",id:a})};SITE_MAIN.loadPage=function(b,a){SITE_MAIN.infoDat=b.infoDat||{};SITE_MAIN.verrors=b.verrors;if(SITE_MAIN.infoDat.infoBase){SITE_MAIN.pageId=SITE_MAIN.infoDat.infoBase.id}else{SITE_MAIN.pageId=$("title").text().substring(0,12)}if(typeof(a)=="function"){a(SITE_MAIN)}};SITE_MAIN.initPageJqObj=function(){SITE_MAIN.jqObj={artTitle:$("h3.title"),artTime:$("span.time"),artReadNum:$("span.read-num"),artAuthor:$("span.author"),artSummary:$("blockquote.summary"),artContent:$("div#main article"),artPicDir:$("div.main-pic"),artMainPic:$("div.main-pic img"),outSiteHref:$("a.site-url"),loveNav:$("a.love"),hateNav:$("a.hate")}};SITE_MAIN.INFO={};SITE_MAIN.INFO.doInit=function(){SITE_MAIN.initPageJqObj()};SITE_MAIN.INFO.doRender=function(){if(SITE_MAIN.existError()){return}SITE_MAIN.jqObj.artTitle.text(SITE_MAIN.infoDat.infoBase.title);SITE_MAIN.jqObj.artTime.text(ut.parseDate(SITE_MAIN.infoDat.infoBase.createTime,10));SITE_MAIN.jqObj.artReadNum.text("\u9605\u8bfb\uff1a"+SITE_MAIN.infoDat.infoBase.viewNum+"\u6b21");SITE_MAIN.jqObj.artAuthor.text("["+SITE_MAIN.infoDat.infoBase.authorId+"]");SITE_MAIN.jqObj.loveNav.find("span.zan-count").text(SITE_MAIN.infoDat.infoBase.loveNum);SITE_MAIN.jqObj.hateNav.find("span.cai-count").text(SITE_MAIN.infoDat.infoBase.hateNum);SITE_MAIN.jqObj.loveNav.data("id",SITE_MAIN.infoDat.infoBase.id);SITE_MAIN.jqObj.hateNav.data("id",SITE_MAIN.infoDat.infoBase.id);SITE_MAIN.jqObj.artSummary.text(SITE_MAIN.infoDat.infoBase.summary);if(SITE_MAIN.infoDat.infoBase.hasPic===1){var b=SITE_MAIN.getUrl(SITE_MAIN.infoDat.infoBase.picUrl);if(b!=""){SITE_MAIN.jqObj.artMainPic.attr("src",b);SITE_MAIN.jqObj.artPicDir.show()}}if(SITE_MAIN.infoDat.infoBase.siteUrl&&SITE_MAIN.infoDat.infoBase.siteUrl.length>5){var a=SITE_MAIN.getUrl(SITE_MAIN.infoDat.infoBase.siteUrl);if(a!=""){SITE_MAIN.jqObj.outSiteHref.attr("href",a);SITE_MAIN.jqObj.outSiteHref.show()}}if(SITE_MAIN.infoDat.infoContent&&SITE_MAIN.infoDat.infoContent.content){setTimeout(function(){SITE_MAIN.jqObj.artContent.html(SITE_MAIN.infoDat.infoContent.content);SITE_MAIN.fixArtImage()},ut.rndint(1000,2000))}SITE_MAIN.doHit(SITE_MAIN.infoDat.infoBase.id)};SITE_MAIN.H5G={};SITE_MAIN.H5G.doInit=function(){SITE_MAIN.initPageJqObj();SITE_MAIN.jqObj.playBtn=$("#playBtn")};SITE_MAIN.H5G.configPlayBtn=function(){SITE_MAIN.jqObj.playBtn.on("click",function(){location.href=window.ctx+"/h5g/play?id="+SITE_MAIN.infoDat.infoBase.id+"&t="+Math.random()*1000})};SITE_MAIN.H5G.doRender=function(){if(SITE_MAIN.existError()){return}SITE_MAIN.jqObj.artTitle.text(SITE_MAIN.infoDat.infoBase.title);SITE_MAIN.jqObj.artReadNum.text("\u6709"+SITE_MAIN.infoDat.infoBase.viewNum+"\u4eba\u73a9\u8fc7");SITE_MAIN.jqObj.artAuthor.text("["+SITE_MAIN.infoDat.infoBase.authorId+"]");SITE_MAIN.jqObj.artSummary.text(SITE_MAIN.infoDat.infoBase.summary);SITE_MAIN.jqObj.loveNav.find("span.zan-count").text(SITE_MAIN.infoDat.infoBase.loveNum);SITE_MAIN.jqObj.hateNav.find("span.cai-count").text(SITE_MAIN.infoDat.infoBase.hateNum);SITE_MAIN.jqObj.loveNav.data("id",SITE_MAIN.infoDat.infoBase.id);SITE_MAIN.jqObj.hateNav.data("id",SITE_MAIN.infoDat.infoBase.id);if(SITE_MAIN.infoDat.infoBase.hasPic===1){var b=SITE_MAIN.getUrl(SITE_MAIN.infoDat.infoBase.picUrl);if(b!=""){SITE_MAIN.jqObj.artMainPic.attr("src",b);SITE_MAIN.jqObj.artPicDir.show()}}if(SITE_MAIN.infoDat.infoBase.siteUrl&&SITE_MAIN.infoDat.infoBase.siteUrl.length>5){var a=SITE_MAIN.getUrl(SITE_MAIN.infoDat.infoBase.siteUrl);if(a!=""){SITE_MAIN.H5G.configPlayBtn()}}if(SITE_MAIN.infoDat.infoContent&&SITE_MAIN.infoDat.infoContent.content){setTimeout(function(){SITE_MAIN.jqObj.artContent.html(SITE_MAIN.infoDat.infoContent.content);SITE_MAIN.fixArtImage()},ut.rndint(1000,2000))}SITE_MAIN.doHit(SITE_MAIN.infoDat.infoBase.id)};SITE_MAIN.H5G_PLAY={};SITE_MAIN.H5G_PLAY.doInit=function(){SITE_MAIN.jqObj={h5gIframe:$("#h5gIframe"),loveNav:$("a.love"),hateNav:$("a.hate")}};SITE_MAIN.H5G_PLAY.doRender=function(){if(SITE_MAIN.existError()){return}SITE_MAIN.jqObj.loveNav.find("span.zan-count").text(SITE_MAIN.infoDat.infoBase.loveNum);SITE_MAIN.jqObj.hateNav.find("span.cai-count").text(SITE_MAIN.infoDat.infoBase.hateNum);SITE_MAIN.jqObj.loveNav.data("id",SITE_MAIN.infoDat.infoBase.id);SITE_MAIN.jqObj.hateNav.data("id",SITE_MAIN.infoDat.infoBase.id);if(SITE_MAIN.infoDat.infoBase.siteUrl&&SITE_MAIN.infoDat.infoBase.siteUrl.length>5){var b=SITE_MAIN.getUrl(SITE_MAIN.infoDat.infoBase.siteUrl);if(b!=""){var a=$(window).height()+$(window).scrollTop();SITE_MAIN.jqObj.h5gIframe.css({height:(parseInt(a/16)+1.5)+"em"});SITE_MAIN.jqObj.h5gIframe.load(function(){var c=$(this).contents().find("body").height()+32;$(this).height(c<500?500:c)});SITE_MAIN.jqObj.h5gIframe.attr("src",b+"index.html?T="+Math.random()*1000+"&frwahash="+SITE_MAIN.frwahash)}SITE_MAIN.doHit(SITE_MAIN.infoDat.infoBase.id)}};SITE_MAIN.UYAN={};var uyan_config;SITE_MAIN.UYAN.doInit=function(a){if(a){SITE_MAIN.UYAN.config={su:a};uyan_config=SITE_MAIN.UYAN.config;$.getScript("http://v2.uyan.cc/code/uyan.js?uid=2088046&_t="+Math.random())}};SITE_MAIN.BDSHARE={};SITE_MAIN.BDSHARE.doInit=function(){window._bd_share_config={common:{bdSnsKey:{},bdText:"",bdMini:"2",bdMiniList:["weixin","tqq","bdxc","tieba","sqq","diandian","huaban","people","mail","isohu","copy"],bdPic:"",bdStyle:"1",bdSize:"24"},share:{},image:{viewList:["qzone","weixin","tsina","tqq","sqq"],viewText:"\u5206\u4eab\u5230\uff1a",viewSize:"24"},selectShare:{bdContainerClass:null,bdSelectMiniList:["qzone","weixin","tsina","tqq","sqq"]}};$.getScript("http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion="+~(-new Date()/3600000))};SITE_MAIN.NAV={};SITE_MAIN.NAV.currPage=1;SITE_MAIN.NAV.LATEST={};SITE_MAIN.NAV.LATEST.doInit=function(){SITE_MAIN.jqObj={infoList:$("div.info-list"),navNextBtn:$("a.nav-next")};SITE_MAIN.jqObj.navNextBtn.on("click",function(){SITE_MAIN.NAV.fetchLatest()})};SITE_MAIN.NAV.LATEST.loveClick=function(c){var b=$(c);var a=b.data("clicked");if(!a){b.data("clicked",1);var e=b.data("id");var d={id:e,mood:"love",_method:"put"};$.post(window.ctx+"/info/api/post-mood.json",d,function(){var g=b.find("span.zan-count");var f=parseInt(g.text());g.text(String(f+1))})}};SITE_MAIN.NAV.LATEST.hateClick=function(c){var b=$(c);var a=b.data("clicked");if(!a){b.data("clicked",1);var e=b.data("id");var d={id:e,mood:"hate",_method:"put"};b.unbind("click");$.post(window.ctx+"/info/api/post-mood.json",d,function(){var f=b.find("span.cai-count");var g=parseInt(f.text());f.text(String(g+1))})}};SITE_MAIN.NAV.LATEST.viewAllClick=function(e){var c=$(e);var g=c.data("id");var d=$("#content"+g);var a=c.data("view");var b=c.data("opened");if(!a){var f={id:g,flag:"content"};$.get(window.ctx+"/info/api/view-cont.json",f,function(h){c.data("view",1);c.data("opened",true);c.html("\u6536\u8d77 <span>\u2227</span>");if(h.infoConent){d.html(h.infoConent.content);d.find("img").addClass("img-responsive center-block")}});return}if(b){c.data("opened",false);d.removeClass("show").addClass("hidden");c.html("\u770b\u5168\u6587 <span>&#969;</span>")}else{if(!b){c.data("opened",true);d.removeClass("hidden").addClass("show");c.html("\u6536\u8d77 <span>\u2227</span>")}}};SITE_MAIN.NAV.LATEST.talkClick=function(c){var b=$(c);var d=b.data("id");var a=b.data("su");location.href=SITE_MAIN.getNavUrl(a,d)+"#uyan"};SITE_MAIN.NAV.fetchLatest=function(){var a={pageNo:SITE_MAIN.NAV.currPage,listSize:12};SITE_MAIN.jqObj.navNextBtn.text("\u52aa\u529b\u52a0\u8f7d\u4e2d...");$.get(window.ctx+"/info/api/fetch-latest.json",a,function(b){if(b.pageDTO.datas&&b.pageDTO.datas.length>0){SITE_MAIN.jqObj.infoList.append(template("infoBoxTpl",b.pageDTO));SITE_MAIN.NAV.currPage++;SITE_MAIN.jqObj.navNextBtn.text("\u221e \u70b9\u6211\u7ee7\u7eed :-D")}else{SITE_MAIN.jqObj.navNextBtn.unbind("click");SITE_MAIN.jqObj.navNextBtn.text("wow\uff01\u5230\u5e95\u4e86,\u5c0f\u7f16\u6b63\u5728\u7f16\u8f91\u4e2d...").delay(2000).fadeOut()}})};
