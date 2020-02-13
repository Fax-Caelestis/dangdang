${path}/front<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" import="java.util.*" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>用户注册 - 当当网</title>
		<link href="${path}/front/css/login.css" rel="stylesheet" type="text/css" />
		<link href="${path}/front/css/page_bottom.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${path}/front/js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript" >
		
	  	function chgCode() {
			var imgObj=document.getElementById("code");
			imgObj.src="${path }/user/getImageCode?xx="+Math.random();
		}
	 
	 
			$(function(){
			
				//点击切换验证码

				var emails=false;
				var nickNames=false;
				var passwords=false;
				var RepeatPasswords=false;
				var imageCodes=false;
				
				//表单验证
				//邮箱输入框
				$("#txtEmail").blur(function(){
				
					//获取input中的内容
					var email =$("#txtEmail").val();
					
					//判断是否为空
					if(email == ""){
						$("#emailMsg").html("<font style='color:red'><strong>邮箱不能为空</strong></font>");	
					}else{
						var emailStyle = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/; 
						//验证邮箱格式
						if(emailStyle.test(email)){
							$("#emailMsg").html("<font style='color:green'><strong>验证成功</strong></font>");	
							emails=true;
						}else{
							$("#emailMsg").html("<font style='color:red'><strong>邮箱格式不正确</strong></font>");
						}
					}
				});
				
				//昵称验证
				$("#txtNickName").blur(function(){
				
					//获取input中的内容
					var nickName =$("#txtNickName").val();
					
					//判断是否为空
					if(nickName == ""){
						$("#nickNameMsg").html("<font style='color:red'><strong>昵称必填</strong></font>");	
					}else{
						//验证昵称长度
						if(nickName.length>=4){
							$("#nickNameMsg").html("<font style='color:green'><strong>验证成功</strong></font>");	
							nickNames=true;
						}else{
							$("#nickNameMsg").html("<font style='color:red'><strong>昵称最少4位</strong></font>");
						}
					}
				});
				
				//密码验证
				$("#txtPassword").blur(function(){
				
					//获取input中的内容
					var password =$("#txtPassword").val();
					
					//判断是否为空
					if(password == ""){
						$("#passwordMsg").html("<font style='color:red'><strong>密码必填</strong></font>");	
					}else{
						//验证密码长度
						if(password.length>=6){
							$("#passwordMsg").html("<font style='color:green'><strong>验证成功</strong></font>");	
							passwords=true;
						}else{
							$("#passwordMsg").html("<font style='color:red'><strong>密码最少6位</strong></font>");
						}
					}
				});
				
				//确认密码验证
				$("#txtRepeatPass").blur(function(){
				
					//获取input中的内容
					var RepeatPassword =$("#txtRepeatPass").val();
									
					//判断是否为空
					if(RepeatPassword == ""){
						$("#RepeatPasswordMsg").html("<font style='color:red'><strong>密码必填</strong></font>");	
					}else{
						//获取设置的密码
						var password =$("#txtPassword").val();
						if(RepeatPassword == password){
							$("#RepeatPasswordMsg").html("<font style='color:green'><strong>验证成功</strong></font>");	
							RepeatPasswords=true;
						}else{
							$("#RepeatPasswordMsg").html("<font style='color:red'><strong>密码不一致</strong></font>");
						}
					}
				});
				
				//验证码验证
				$("#txtVerifyCode").blur(function(){
				
					//获取input中的内容
					var imageCode =$("#txtVerifyCode").val();
									
					//判断是否为空
					if(imageCode == ""){
						$("#imageCodeMsg").html("<font style='color:red'><strong>验证码必填</strong></font>");	
					}else{
						
						if(imageCode.length==4){
							$("#imageCodeMsg").html("<font style='color:green'><strong>验证成功</strong></font>");	
							imageCodes=true;
						}else{
							$("#imageCodeMsg").html("<font style='color:red'><strong>验证码格式不正确</strong></font>");
						}
					}
				});
				
				//提交按钮的验证
				$("form").submit(function(){
					
					//将所有的input框都验证一遍
					$("input").blur();

					//如果有不符合的数据就不提交表单
					if(emails && nickNames && passwords && RepeatPasswords && imageCodes){
						//提交表单
						$("form").submit();
					}else{
						return false;
					}
				});
			});
		</script>
		
	</head>
	<body>
		<%@include file="../common/head1.jsp"%>
		<div class="login_step">
			注册步骤:
			<span class="red_bold">1.填写信息</span> > 2.验证邮箱 > 3.注册成功
		</div>
		<div class="fill_message">
			<form name="ctl00" method="post" action="${path}/user/add" id="f">
				<h2>
					以下均为必填项  &emsp;&nbsp;&emsp;&emsp;&emsp;&emsp;<font style='color: red'><strong>${message}</strong></font>
				</h2>
				<table class="tab_login" >
					<tr>
						<td valign="top" class="w1">
							请填写您的Email地址：
						</td>
						<td>
							<input name="user.email" type="text" id="txtEmail" class="text_input"/>
							<div class="text_left" id="emailValidMsg">
								<p>
									请填写有效的Email地址，在下一步中您将用此邮箱接收验证邮件。
								</p>
									<span id="emailMsg"/>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							设置您在当当网的昵称：
						</td>
						<td>
							<input name="user.nick_name" type="text" id="txtNickName" class="text_input" />
							<div class="text_left" id="nickNameValidMsg">
								<p>
									您的昵称可以由小写英文字母、中文、数字组成，
								</p>
								<p>
									长度4－20个字符，一个汉字为两个字符。
								</p>
								<span id="nickNameMsg"/>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							设置密码：
						</td>
						<td>
							<input name="user.password" type="password" id="txtPassword" class="text_input" />
							<div class="text_left" id="passwordValidMsg">
								<p>
									您的密码可以由大小写英文字母、数字组成，长度6－20位。
								</p>
								<span id="passwordMsg"/>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							再次输入您设置的密码：
						</td>
						<td>
							<input name="password1" type="password" id="txtRepeatPass" class="text_input"/>
							<div class="text_left" id="repeatPassValidMsg">
							<span id="RepeatPasswordMsg"/>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							验证码：
						</td>
						<td>
							<img class="yzm_img" id='code' src="<c:url value="/user/getImageCode"/>" />
							<input name="code" type="text" id="txtVerifyCode" class="yzm_input"/>
							<div class="text_left t1">
								<p class="t1">
									<span id="vcodeValidMsg">请输入图片中的四个字母。</span>
									<span id="imageCodeMsg"/>
									<a href="javascript:void(0)" id="changeImg"   onclick="chgCode()">看不清楚？换个图片</a>
								</p>
							</div>
						</td>
					</tr>
				</table>

				<div class="login_in">

					<input id="btnClientRegister" class="button_1" name="submit"  type="submit" value="注 册"/>
				</div>
			</form>
		</div>
		<%@include file="../common/foot1.jsp"%>
	</body>
</html>

