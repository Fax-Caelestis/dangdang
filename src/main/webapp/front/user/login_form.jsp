<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" import="java.util.*" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>登录 - 当当网</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="${path}/front/css/login.css" rel="stylesheet" type="text/css" />
		<link href="${path}/front/css/page_bottom.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${path}/front/js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript" src="${path}/front/js/jquery.validate.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$.extend($.validator.messages, {
				    required: "必填",
				    minlength: $.validator.format("最少输入6个字符"),
				});
			});
		</script>
	</head>
	<body>

		<%@include file="../common/head1.jsp"%>type="redirectAction">random

		<div class="enter_part">

			<%@include file="../common/introduce.jsp"%>

			<div class="enter_in">
				<div class="bj_top"></div>
				<div class="center">
					<div style="height: 30px; padding: 5px; color: red" id="divErrorMssage">
					
					</div>
					<div class="main">
						<h3>
							登录当当网  &emsp;&emsp;&emsp;&emsp;<font style='color: red'><strong>${message}</strong></font>
						</h3>

						<form method="post" action="${path}/user/login" id="ctl00">
							<ul>
								<li>
									<span>请输入Email地址：</span>
									<input minlength="6" required type="text" name="user.email" id="txtEmail" class="textbox" />
								</li>
								<li>
									<span class="blank">密码：</span>
									<input minlength="6" required type="password" name="user.password" id="txtPassword" class="textbox" />
								</li>
								<li>
									<input type="submit" id="btnSignCheck" class="button_enter" value="登 录" />
								</li>
							</ul>
							
						</form>
					</div>
					<div class="user_new">
						<p>
							您还不是当当网用户？
						</p>
						<p class="set_up">
							<a href="register_form.jsp">创建一个新用户&gt;&gt;</a>
						</p>
					</div>
				</div>
			</div>
		</div>

		<%@include file="../common/foot1.jsp"%>

	</body>
</html>

