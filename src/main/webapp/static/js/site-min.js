var SITE_PAGE=PAGE_DATA||{};SITE_PAGE.getUrl=function(a){if(!a){return"https://img.alicdn.com/imgextra/i2/152137799/T2jXVgXgdOXXXXXXXX_!!152137799.gif"}if(a.indexOf("http")!==0&&a.indexOf(window.ctx)<0){return window.ctx+a}return a};SITE_PAGE.existError=function(){if(SITE_PAGE.verrors&&SITE_PAGE.verrors.length>0){alert("\u8bfb\u53d6\u51fa\u9519,\u8bf7\u7a0d\u540e\u518d\u8bd5! \r\n "+SITE_PAGE.verrors.join("\r\n"));return true}return false};SITE_PAGE.fixArtImage=function(){$("div#main article img").addClass("img-responsive center-block")};SITE_PAGE.doHit=function(a){$.post(window.ctx+"/info/viewnum/hit.json",{_method:"put",id:a})};SITE_PAGE.INFO={};SITE_PAGE.INFO.doInit=function(){SITE_PAGE.jqObj={artTitle:$("h3.title"),artTime:$("span.time"),artReadNum:$("span.read-num"),artAuthor:$("span.author"),artSummary:$("blockquote.summary"),artContent:$("div#main article"),artPicDir:$("div.main-pic"),artMainPic:$("div.main-pic img"),outSiteHref:$("a.site-url")}};SITE_PAGE.INFO.doRender=function(){if(SITE_PAGE.existError()){return}SITE_PAGE.jqObj.artTitle.text(SITE_PAGE.infoDat.infoBase.title);SITE_PAGE.jqObj.artTime.text(ut.parseDate(SITE_PAGE.infoDat.infoBase.createTime,10));SITE_PAGE.jqObj.artReadNum.text("\u9605\u8bfb\uff1a"+SITE_PAGE.infoDat.infoBase.viewNum+"\u6b21");SITE_PAGE.jqObj.artAuthor.text("["+SITE_PAGE.infoDat.infoBase.authorId+"]");SITE_PAGE.jqObj.artSummary.text(SITE_PAGE.infoDat.infoBase.summary);if(SITE_PAGE.infoDat.infoBase.hasPic===1){var b=SITE_PAGE.getUrl(SITE_PAGE.infoDat.infoBase.picUrl);if(b!=""){SITE_PAGE.jqObj.artMainPic.attr("src",b);SITE_PAGE.jqObj.artPicDir.show()}}if(SITE_PAGE.infoDat.infoBase.siteUrl&&SITE_PAGE.infoDat.infoBase.siteUrl.length>5){var a=SITE_PAGE.getUrl(SITE_PAGE.infoDat.infoBase.siteUrl);if(a!=""){SITE_PAGE.jqObj.outSiteHref.attr("href",a);SITE_PAGE.jqObj.outSiteHref.show()}}if(SITE_PAGE.infoDat.infoContent&&SITE_PAGE.infoDat.infoContent.content){setTimeout(function(){SITE_PAGE.jqObj.artContent.html(SITE_PAGE.infoDat.infoContent.content);SITE_PAGE.fixArtImage()},ut.rndint(1000,2000))}SITE_PAGE.doHit(SITE_PAGE.infoDat.infoBase.id)};SITE_PAGE.H5G={};SITE_PAGE.H5G.doInit=function(){SITE_PAGE.jqObj={artTitle:$("h3.title"),artTime:$("span.time"),artReadNum:$("span.read-num"),artAuthor:$("span.author"),artSummary:$("blockquote.summary"),artContent:$("div#main article"),artPicDir:$("div.main-pic"),artMainPic:$("div.main-pic img"),playBtn:$("#playBtn")}};SITE_PAGE.H5G.configPlayBtn=function(){SITE_PAGE.jqObj.playBtn.on("click",function(){location.href=window.ctx+"/h5g/play?id="+SITE_PAGE.infoDat.infoBase.id+"&t="+Math.random()*1000})};SITE_PAGE.H5G.doRender=function(){if(SITE_PAGE.existError()){return}SITE_PAGE.jqObj.artTitle.text(SITE_PAGE.infoDat.infoBase.title);SITE_PAGE.jqObj.artTime.text(ut.parseDate(SITE_PAGE.infoDat.infoBase.createTime,10));SITE_PAGE.jqObj.artReadNum.text("\u6709"+SITE_PAGE.infoDat.infoBase.viewNum+"\u4eba\u73a9\u8fc7");SITE_PAGE.jqObj.artAuthor.text("["+SITE_PAGE.infoDat.infoBase.authorId+"]");SITE_PAGE.jqObj.artSummary.text(SITE_PAGE.infoDat.infoBase.summary);if(SITE_PAGE.infoDat.infoBase.hasPic===1){var b=SITE_PAGE.getUrl(SITE_PAGE.infoDat.infoBase.picUrl);if(b!=""){SITE_PAGE.jqObj.artMainPic.attr("src",b);SITE_PAGE.jqObj.artPicDir.show()}}if(SITE_PAGE.infoDat.infoBase.siteUrl&&SITE_PAGE.infoDat.infoBase.siteUrl.length>5){var a=SITE_PAGE.getUrl(SITE_PAGE.infoDat.infoBase.siteUrl);if(a!=""){SITE_PAGE.H5G.configPlayBtn()}}if(SITE_PAGE.infoDat.infoContent&&SITE_PAGE.infoDat.infoContent.content){setTimeout(function(){SITE_PAGE.jqObj.artContent.html(SITE_PAGE.infoDat.infoContent.content);SITE_PAGE.fixArtImage()},ut.rndint(1000,2000))}SITE_PAGE.doHit(SITE_PAGE.infoDat.infoBase.id)};SITE_PAGE.H5G_PLAY={};SITE_PAGE.H5G_PLAY.doInit=function(){SITE_PAGE.jqObj={h5gIframe:$("#h5gIframe")}};SITE_PAGE.H5G_PLAY.doRender=function(){if(SITE_PAGE.existError()){return}if(SITE_PAGE.infoDat.infoBase.siteUrl&&SITE_PAGE.infoDat.infoBase.siteUrl.length>5){var b=SITE_PAGE.getUrl(SITE_PAGE.infoDat.infoBase.siteUrl);if(b!=""){var a=$(window).height()+$(window).scrollTop();SITE_PAGE.jqObj.h5gIframe.css({height:(parseInt(a/16)+1.5)+"em"});SITE_PAGE.jqObj.h5gIframe.load(function(){var c=$(this).contents().find("body").height()+32;$(this).height(c<500?500:c)});SITE_PAGE.jqObj.h5gIframe.attr("src",b+"index.html?T="+Math.random()*1000+"&frwahash="+SITE_PAGE.frwahash)}SITE_PAGE.doHit(SITE_PAGE.infoDat.infoBase.id)}};
