<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="ut" uri="/utils"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>TXCMS 管理平台登录</title>
<%@include file="inc-css.jspf" %>
<style>
.none{display:none;}
label.error{margin:0.2em 1.2em;}
#vcode{width:100%;height:4em;margin-top:0.1em;border:1px solid #DDDDDD;}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">登录管理平台</h3>
					</div>
					<div class="panel-body">
						<form role="form" id="login_form">
							<fieldset>
								<div class="form-group">
									<input class="form-control notEmpty" placeholder="用户名" id="login_name" name="name" type="text" autofocus>
									<label for="login_name" class="error none"></label>
								</div>
								<div class="form-group">
								    <input name="hashkey" id="login_hashkey" type="hidden">
									<input class="form-control notEmpty" placeholder="登录密码" id="login_pass" name="password" type="password" value="">
									<label for="login_pass" class="error none"></label>
								</div>
								<div class="form-group hidden" id="vcode_group">
									<input class="form-control captcha" placeholder="请输入图片中的字符" id="login_captcha" name="captcha" type="text" value="">
									<img id="vcode" class="vcode codeimg" src="${ut:getCtxPath()}/static/image/blank.gif" data-src="${ut:getCtxPath()}/captcha/a">
	                                <a href="javascript:void();" id="refresh_captcha">不好识别, 换一张</a>
	                                <label for="login_captcha" class="error none"></label>
								</div>
								<div id="login_errors" class="alert alert-warning none">
									<button class="close" type="button">×</button>
									<h5>登录系统出现错误：</h5>
									<p class="details"></p>
								</div>
								<button id="login_submit_btn" class="btn btn-lg btn-success btn-block" type="button">确 定</button>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

<%@include file="inc-js.jspf" %>
<script>
var PAGE_EL = {
		login_form : $('#login_form'),
		login_captcha : $('#login_captcha'),
		refresh_captcha : $('#refresh_captcha'),
		login_pass : $('#login_pass'),
		login_hashkey : $('#login_hashkey'),
		login_submit_btn : $('#login_submit_btn'),
		vcode : $('#vcode'),
		vcode_group : $('#vcode_group'),
		login_errors : $('#login_errors'),
		login_flag:0
};

$(function(){

	PAGE_EL.refresh_captcha.click(function(){
		PAGE_EL.vcode.attr('src', PAGE_EL.vcode.data('src')+ut.rndChr(8));
	});
	
	$.validator.addMethod("notEmpty", function(value, element) {
		return (!value || $.trim(value)=='')?false:true;
	}, '该项不能为空.');
	
	$.validator.addMethod("captcha", function(value, element) {
		return ut.validCaptcha(value);
	}, '验证码填写有误哦.');
	
	PAGE_EL.login_pass.focus(function(){
		PAGE_EL.vcode_group.removeClass('hidden');
		PAGE_EL.refresh_captcha.click();
	});
	
	PAGE_EL.login_submit_btn.click(function(){
		if(!PAGE_EL.login_form.valid() ) {
			return false;
		}
		var pass = PAGE_EL.login_pass.val();
		var vc = ut.lower(PAGE_EL.login_captcha.val());
		PAGE_EL.login_hashkey.val(ut.hashPassKey(pass, vc));
		PAGE_EL.login_pass.val(ut.rndChr(64));
		PAGE_EL.login_form.submit();
	});
	
	PAGE_EL.login_errors.find('button.close').click(function(){
		PAGE_EL.login_errors.find('p.details').empty();
		PAGE_EL.login_errors.hide();
	});
	
	PAGE_EL.login_form.on('submit',function(event) {
	     event.preventDefault();
	     var loginUrl = window.ctx + '/manager/verify/check?ref=login.page';
	     var consoleUrl = window.ctx + '/manager/console';
		 jQuery.ajax({
				type: 'post',
				url: loginUrl,
				data: PAGE_EL.login_form.serialize(),
				dataType: "json",
				beforeSend : function(xhr){
					PAGE_EL.login_submit_btn.attr('disabled','disabled');
					PAGE_EL.login_submit_btn.text('正在登录...');
				},
				success: function(data,textStatus, xhr){
					if(data) {
						if(data.validErrors.length==0) {
							PAGE_EL.login_flag = 1;
							ut.reload(consoleUrl+'?t='+ut.r());
						}else{
							var errors = data.validErrors.join('<br/>');
							PAGE_EL.login_errors.find('p.details').html(errors);
							PAGE_EL.login_errors.show();
						}
					}
				},
				error : function(xhr, textStatus, err){
					alert('登录出现错误，请联系运维.');
				},
				complete :function(xhr, textStatus){
					    PAGE_EL.login_pass.val('');
					    if(PAGE_EL.login_flag==0){
					    	PAGE_EL.vcode_group.addClass('hidden');
							PAGE_EL.login_submit_btn.removeAttr('disabled');
							PAGE_EL.login_submit_btn.text('确 定');
					    }
				}
			});
	   return false;
	 });
	
});
</script>
</body>
</html>