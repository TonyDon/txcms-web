var SITE_MAIN={};SITE_MAIN.getUrl=function(a){if(!a){return""}if(a.indexOf("http")!==0){if(/.*\/store\/.*/.test(a)){return"http://s.986001.com"+window.ctx+a}return window.ctx+a}return a};SITE_MAIN.getNavUrl=function(a,c){var b=("/info/"+c);if(a&&a.indexOf("h5gfs")>=0){b=("/h5g/show?id="+c)}return SITE_MAIN.getUrl(b)};SITE_MAIN.existError=function(){if(SITE_MAIN.verrors&&SITE_MAIN.verrors.length>0){alert("读取出错,请稍后再试! \r\n "+SITE_MAIN.verrors.join("\r\n"));return true}return false};SITE_MAIN.fixArtImage=function(){$("div#main article img").addClass("img-responsive center-block")};SITE_MAIN.fmtSummary=function(a){if(a&&a.length>0){return a.replace(/\n/gi,"<br/>")}return a};SITE_MAIN.isH5G=function(a){return SITE_CAT_LIST["c"+a]&&SITE_CAT_LIST["c"+a].catPath.indexOf("0-30-")!=-1};SITE_MAIN.doHit=function(a){$.post(window.ctx+"/info/api/hit-viewnum.json",{_method:"put",id:a})};SITE_MAIN.loadPage=function(b,a){SITE_MAIN.infoDat=b.infoDat||{};SITE_MAIN.verrors=b.verrors;if(SITE_MAIN.infoDat.infoBase){SITE_MAIN.pageId=SITE_MAIN.infoDat.infoBase.id}else{SITE_MAIN.pageId=$("title").text().substring(0,12)}if(typeof(a)=="function"){a(SITE_MAIN)}};SITE_MAIN.initPageJqObj=function(){SITE_MAIN.jqObj={artTitle:$("h3.title"),artTime:$("span.time"),artReadNum:$("span.read-num"),artAuthor:$("span.author"),artSummary:$("blockquote.summary"),artContent:$("div#main article"),artPicDir:$("div.main-pic"),artMainPic:$("div.main-pic img"),loveNav:$("a.love"),hateNav:$("a.hate"),randPick:$("a.rand-pick"),goPrev:$("a.prev"),goNext:$("a.next"),artMainVideo:$("div.main-video"),vplayer:$("#vplayer"),ifvplayer:$("#ifvplayer")}};SITE_MAIN.getCatNav=function(h){if(!h||!SITE_CAT_LIST){return""}var g="c"+h;var a=SITE_CAT_LIST[g];var f=a.catPath;var e=f.substring(2,f.length-1).split("-");var b=[];for(var d in e){b.push(SITE_CAT_LIST["c"+e[d]].name)}return b.join("/")};SITE_MAIN.INFO={};SITE_MAIN.INFO.doInit=function(){SITE_MAIN.initPageJqObj()};SITE_MAIN.INFO.doRender=function(){if(SITE_MAIN.existError()){return}var b=SITE_MAIN.infoDat.infoBase;var e=b.id;var d=SITE_MAIN.jqObj;d.artTitle.text(b.title);d.artReadNum.text("浏览 "+b.viewNum+"次");d.artAuthor.text("["+b.authorId+"]");d.loveNav.find("span.zan-count").text(b.loveNum);d.hateNav.find("span.cai-count").text(b.hateNum);d.loveNav.data("id",e);d.hateNav.data("id",e);d.randPick.data("id",e);d.randPick.data("cid",b.catId);d.goPrev.data("id",e);d.goNext.data("id",e);d.goPrev.data("cid",b.catId);d.goNext.data("cid",b.catId);d.artSummary.html(SITE_MAIN.fmtSummary(b.summary));if(b.hasPic===1&&b.hasVideo!==1){var c=SITE_MAIN.getUrl(b.picUrl);if(c!=""){d.artMainPic.attr("src",c);d.artPicDir.show()}}if(b.hasVideo===1){var a=SITE_MAIN.getUrl(b.videoUrl);var f=SITE_MAIN.getUrl(b.siteUrl);if(a!=""){d.vplayer.attr("src",a);d.vplayer.attr("preload","auto");var c=SITE_MAIN.getUrl(b.picUrl);if(c!=""){d.vplayer.attr("poster",c)}d.vplayer.click(function(){var g=d.vplayer.data("s")||"0";if(g=="0"){this.play();d.vplayer.data("s","1")}else{if(g=="1"){this.pause();d.vplayer.data("s","0")}}});d.ifvplayer.hide();d.artMainVideo.show()}else{if(f!=""){d.vplayer.hide();d.ifvplayer.attr("src",f);d.artMainVideo.show()}}}if(SITE_MAIN.infoDat.infoContent&&SITE_MAIN.infoDat.infoContent.infoId){setTimeout(function(){SITE_MAIN.fixArtImage()},ut.rndint(1000,2000))}SITE_MAIN.doHit(e)};SITE_MAIN.INFO.a1="驿站访客过多，请稍后再试哦~";SITE_MAIN.INFO.randPick=function(b){var a=$(b);var e=a.data("id");var d=a.data("cid");var c={id:e,rnd:ut.r(),cid:d,s:location.href};$.get(window.ctx+"/info/api/rand-pick.json",c,function(f){if(f&&f.id){if(SITE_MAIN.isH5G(d)){location.href=window.ctx+"/h5g/show?id="+f.id+"&fr=randpick&t="+Math.random()*1000}else{location.href=window.ctx+"/info/"+f.id+"?fr=randpick&t="+Math.random()*1000}}else{alert(SITE_MAIN.INFO.a1)}})};SITE_MAIN.INFO.go=function(c,a){var b=$(c);var f=b.data("id");var e=b.data("cid");var d={id:f,rnd:ut.r(),direct:a,cid:e,s:location.href};$.get(window.ctx+"/info/api/go-pick.json",d,function(g){if(g&&g.id){if(SITE_MAIN.isH5G(e)){location.href=window.ctx+"/h5g/show?id="+g.id+"&fr=gopick&t="+Math.random()*1000}else{location.href=window.ctx+"/info/"+g.id+"?fr=gopick&t="+Math.random()*1000}}else{alert(SITE_MAIN.INFO.a1)}})};SITE_MAIN.H5G={};SITE_MAIN.H5G.doInit=function(){SITE_MAIN.initPageJqObj();SITE_MAIN.jqObj.playBtn=$("#playBtn")};SITE_MAIN.H5G.configPlayBtn=function(){SITE_MAIN.jqObj.playBtn.on("click",function(){location.href=window.ctx+"/h5g/play?id="+SITE_MAIN.infoDat.infoBase.id+"&t="+Math.random()*1000})};SITE_MAIN.H5G.doRender=function(){if(SITE_MAIN.existError()){return}var b=SITE_MAIN.infoDat.infoBase;var e=b.id;var d=SITE_MAIN.jqObj;d.artTitle.text(b.title);d.artReadNum.text("有"+b.viewNum+"人玩过");d.artAuthor.text("["+b.authorId+"]");d.artSummary.text(b.summary);d.loveNav.find("span.zan-count").text(b.loveNum);d.hateNav.find("span.cai-count").text(b.hateNum);d.loveNav.data("id",e);d.hateNav.data("id",e);d.randPick.data("id",e);d.randPick.data("cid",b.catId);d.goPrev.data("id",e);d.goNext.data("id",e);d.goPrev.data("cid",b.catId);d.goNext.data("cid",b.catId);if(b.hasPic===1){var c=SITE_MAIN.getUrl(b.picUrl);if(c!=""){d.artMainPic.attr("src",c);d.artPicDir.show()}}if(b.siteUrl&&b.siteUrl.length>5){var a=SITE_MAIN.getUrl(b.siteUrl);if(a!=""){SITE_MAIN.H5G.configPlayBtn()}}if(SITE_MAIN.infoDat.infoContent&&SITE_MAIN.infoDat.infoContent.infoId){setTimeout(function(){SITE_MAIN.jqObj.artContent.html(SITE_MAIN.infoDat.infoContent.content);SITE_MAIN.fixArtImage()},ut.rndint(1000,2000))}SITE_MAIN.doHit(e)};SITE_MAIN.H5G_PLAY={};SITE_MAIN.H5G_PLAY.doInit=function(){SITE_MAIN.initPageJqObj();SITE_MAIN.jqObj.h5gIframe=$("#h5gIframe")};SITE_MAIN.H5G_PLAY.doRender=function(){if(SITE_MAIN.existError()){return}var c=SITE_MAIN.infoDat.infoBase;var e=c.id;var d=SITE_MAIN.jqObj;d.artSummary.html(c.title+"<br/>"+c.summary);d.loveNav.find("span.zan-count").text(c.loveNum);d.hateNav.find("span.cai-count").text(c.hateNum);d.loveNav.data("id",e);d.hateNav.data("id",e);d.randPick.data("id",e);d.randPick.data("cid",c.catId);d.goPrev.data("id",e);d.goNext.data("id",e);d.goPrev.data("cid",c.catId);d.goNext.data("cid",c.catId);if(c.siteUrl&&c.siteUrl.length>5){var b=SITE_MAIN.getUrl(c.siteUrl);if(b!=""){var a=$(window).height()+$(window).scrollTop();d.h5gIframe.css({height:(parseInt(a/16)+1.5)+"em"});d.h5gIframe.load(function(){var f=$(this).contents().find("body").height()+32;$(this).height(f<500?500:f)});d.h5gIframe.attr("src",b+"index.html?T="+Math.random()*1000+"&frwahash="+SITE_MAIN.frwahash)}SITE_MAIN.doHit(c.id)}};SITE_MAIN.UYAN={};var uyan_config;SITE_MAIN.UYAN.doInit=function(a){if(a){SITE_MAIN.UYAN.config={su:a};uyan_config=SITE_MAIN.UYAN.config;$.getScript("http://v2.uyan.cc/code/uyan.js?uid=2088046&_t="+Math.random())}};SITE_MAIN.BDSHARE={};SITE_MAIN.BDSHARE.doInit=function(){window._bd_share_config={common:{bdSnsKey:{},bdText:"",bdMini:"2",bdMiniList:["weixin","tqq","bdxc","tieba","sqq","diandian","huaban","people","mail","isohu","copy"],bdPic:"",bdStyle:"1",bdSize:"24"},share:{},image:{viewList:["qzone","weixin","tsina","tqq","sqq"],viewText:"分享到：",viewSize:"24"},selectShare:{bdContainerClass:null,bdSelectMiniList:["qzone","weixin","tsina","tqq","sqq"]}};$.getScript("http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion="+~(-new Date()/3600000))};SITE_MAIN.NAV={};SITE_MAIN.NAV.currPage=1;SITE_MAIN.NAV.LATEST={};SITE_MAIN.NAV.LATEST.doInit=function(){SITE_MAIN.jqObj={infoList:$("div.info-list"),navNextBtn:$("a.nav-next")};SITE_MAIN.jqObj.navNextBtn.on("click",function(){SITE_MAIN.NAV.fetchLatest()});SITE_MAIN.NAV.fetchLatest()};SITE_MAIN.NAV.LATEST.loveClick=function(c){var b=$(c);var a=b.data("clicked");if(!a){b.data("clicked",1);var e=b.data("id");var d={id:e,mood:"love",_method:"put"};$.post(window.ctx+"/info/api/post-mood.json",d,function(){var g=b.find("span.zan-count");var f=parseInt(g.text());g.text(String(f+1))})}};SITE_MAIN.NAV.LATEST.hateClick=function(c){var b=$(c);var a=b.data("clicked");if(!a){b.data("clicked",1);var e=b.data("id");var d={id:e,mood:"hate",_method:"put"};$.post(window.ctx+"/info/api/post-mood.json",d,function(){var f=b.find("span.cai-count");var g=parseInt(f.text());f.text(String(g+1))})}};SITE_MAIN.NAV.LATEST.h5gPlayClick=function(b){var a=$(b);location.href=window.ctx+"/h5g/play?id="+a.data("id")+"&t="+ut.r()};SITE_MAIN.NAV.LATEST.viewAllClick=function(e){var c=$(e);var g=c.data("id");var d=$("#content"+g);var a=c.data("view");var b=c.data("opened");if(!a){var f={id:g,flag:"content"};$.get(window.ctx+"/info/api/view-cont.json",f,function(h){c.data("view",1);c.data("opened",true);c.html("收起 <span>∧</span>");if(h.infoConent){d.html(h.infoConent.content);d.find("img").addClass("img-responsive center-block")}});return}if(b){c.data("opened",false);d.removeClass("show").addClass("hidden");c.html("看全文")}else{if(!b){c.data("opened",true);d.removeClass("hidden").addClass("show");c.html("收起 <span>∧</span>")}}};SITE_MAIN.NAV.LATEST.talkClick=function(c){var b=$(c);var d=b.data("id");var a=b.data("su");location.href=SITE_MAIN.getNavUrl(a,d)+"#uyan"};SITE_MAIN.NAV.fetchLatest=function(){var b={pageNo:SITE_MAIN.NAV.currPage,listSize:16};var a=SITE_MAIN.jqObj;a.navNextBtn.text("努力加载中...");$.get(window.ctx+"/info/api/fetch-latest.json",b,function(c){if(c.pageDTO.datas&&c.pageDTO.datas.length>0){a.infoList.append(template("infoBoxTpl",c.pageDTO));SITE_MAIN.NAV.currPage++;a.navNextBtn.text("点我继续")}else{a.navNextBtn.off("click");a.navNextBtn.text("到底了,看看其他的吧...").delay(2000).fadeOut()}})};SITE_MAIN.NAV.fetchByCat=function(d,a){var c={pageNo:SITE_MAIN.NAV.currPage,listSize:16,catId:d};var b=SITE_MAIN.jqObj;b.navNextBtn.text("努力加载中...");$.get(window.ctx+"/info/api/fetch-cat-list.json",c,function(e){if(e.pageDTO&&e.pageDTO.datas&&e.pageDTO.datas.length>0){b.infoList.append(template("infoBoxTpl",e.pageDTO));SITE_MAIN.NAV.currPage++;b.navNextBtn.text("点我继续 ");if(typeof a==="function"){a()}}else{b.navNextBtn.off("click");b.navNextBtn.text("到底了,小编忙碌中...").delay(2000).fadeOut()}})};SITE_MAIN.NAV.CAT={};SITE_MAIN.NAV.CAT.doInit=function(b,a){SITE_MAIN.jqObj={infoList:$("div.info-list"),navNextBtn:$("a.nav-next")};SITE_MAIN.jqObj.navNextBtn.on("click",function(){SITE_MAIN.NAV.fetchByCat(b,a)});SITE_MAIN.NAV.fetchByCat(b,a)};