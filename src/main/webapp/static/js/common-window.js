/**
* depend jquery.easyui
*
*/
/** window plus  **/
var TxWebWin={};
//确认对话框
TxWebWin.confirm=function(ask, okFunc, cancelFunc){
	 $.messager.confirm('确认提示', ask, function(r){
		 if (r){
		 	if( typeof(okFunc) == 'function' ){
		 		okFunc();
		 	}
		 }else{
			 if( typeof(cancelFunc) == 'function' ){
				 cancelFunc();
			 }
		 }
	});
};
//弹出输入框
TxWebWin.prompt=function(msg, doFunc, emptyFunc){
	 $.messager.prompt('输入提示', msg, function(r){
		 if (r){
		 	if( typeof(doFunc) == 'function'){
		 		doFunc(r);
		 	}
		 }else{
			 if( typeof(emptyFunc) == 'function'){
				 emptyFunc();
			 }
		 }
	});
};
// 提示对话框
TxWebWin.alert=function(msg, doFunc){
	 $.messager.alert('提示消息', msg, doFunc);
};

// 提示错误消息框
TxWebWin.alertError=function(msg, doFunc){
	$.messager.alert('提示消息', msg, 'error', doFunc);
};
//提示警告消息框
TxWebWin.alertWarn=function(msg, doFunc){
	$.messager.alert('提示消息', msg, 'warning', doFunc);
};
// 提升问题消息框
TxWebWin.alertAsk=function(msg, doFunc){
	$.messager.alert('提示消息', msg, 'question', doFunc);
};
// 初始化Window
TxWebWin.initModel=function(id,tit,w,h){
	var _jqObj = $('#'+id);
	_jqObj.window({
		title:tit|| 'Window',
        width:w||550,
        height:h||350,
        modal:true,
        closed:true,
        iconCls:'icon-save',
        onResize:function(){
        	$(this).window('hcenter');
        }
    });
    return _jqObj;
};
/***********************************
 * 对ajax异常消息框的封装
 * 处理服务器返回的各种错误
 * @param event
 * @param request
 * @param settings
 */
function globalAjaxErrorHandler(event, xhr, settings, err){
	if(xhr.status == 400 || xhr.status == 510){// validate failed , Business error
		var result = jQuery.parseJSON(xhr.responseText);
		showErrorMsg(result);
		return;
	}
	if(xhr.status == 403){// deny access.
		var result = "403 拒绝访问.<br/>" + xhr.responseText ;
		showErrorMsg(result);
		return;
	}
	if(window.TxWebWin) {
		try {
			var handler = window;
			while(true) {
				if(! handler.TxWebWin) {
					break;
				}
				var p = handler.parent;
				if(p == handler || !p) {
					return;
				}
				handler = p;
			}
			if(handler && window != handler) {
				handler.globalAjaxErrorHandler(event, xhr, settings);
				return;
			}
		}catch(e){}
	}
	var type = settings.dataTypes.join(",");
	type = type.toLowerCase();
	if(type.match("xml")){
		var result = xhr.responseXML;
		if(result) {
			showErrorMsg(result.firstChild.firstChild.validErrors.nodeValue);
		}else{
			showErrorMsg("系统错误！");
		}
	}else if(type.match(/(json)|(script)/)){
		var result = jQuery.parseJSON(xhr.responseText);
		if(result) {
			showErrorMsg(result);
		} else {
			showErrorMsg("系统错误！");
		}
	}else{
		showErrorMsg(xhr.responseText);
	}
};

function showErrorMsg(res){
	var emsg = '';
	if (res.validErrors) {
		$.each(res.validErrors, function(index, value) {
			emsg +=(value.replace(/\r|\n/g,'<br/>'));
		});
	}else if(res.exception){
		emsg +=(res.exception.replace(/\r|\n/g,'<br/>'));
	}else {
		emsg +=(res.replace(/\r|\n/g,'<br/>'));
	}
	TxWebWin.alertError('<b style="color:red">错误信息：</b><br/><p id="error_msg_box">' + emsg +'</p>');
};