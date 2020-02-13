<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" import="java.util.*" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>生成订单 - 当当网</title>
		<link href="${path}/front/css/login.css" rel="stylesheet" type="text/css" />
		<link href="${path}/front/css/page_bottom.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${path}/front/js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript">
			function change(){
				var addId = $("#addres").val();
				location.href="${path}/adderss/queryById?addId="+addId;
			}
			$(function () {
				var ss = $("#addres");
				ss.empty();
				$.ajax({
					url:"${path}/adderss/queryAll",
					type:"post",
					success:function (data) {
						$.each(data,function (d,b) {
							var optio = $("<option value='"+b.id+"'</option>").text(b.name);
							ss.append(optio)
						})
					}
				})
			})
		</script>
	</head>
	<body>
		<%@include file="../common/head1.jsp"%>
		<div class="login_step">
			生成订单骤: 1.确认订单 >
			<span class="red_bold"> 2.填写送货地址</span> > 3.订单成功
		</div>
		<form name="ctl00" method="post" action="${path}/adderss/addUpdate" id="f">
		<div class="fill_message">
			<p>
				<select id="addres"  onchange="change()">
					<option value="0">填写新地址</option>
				</select>
			</p>														
				<input type="hidden" name="address.id" id="addressIds" value="${address.id}" />
				<input type="hidden" name="address.user_id" id="addressId" value="${sessionScope.user.id}" />

				<table class="tab_login">
					<tr>
						<td valign="top" class="w1">
							收件人姓名：
						</td>
						<td>
							<input type="text" class="text_input" name="address.name" id="receiveName" value="${address.name}" />
							<div class="text_left" id="nameValidMsg">
								<p>
									请填写有效的收件人姓名
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							收件人详细地址：
						</td>
						<td>
							<input type="text" name="address.detail" class="text_input" id="fullAddress" value="${address.detail}"/>
							<div class="text_left" id="addressValidMsg">
								<p>
									请填写有效的收件人的详细地址
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							邮政编码
						</td>
						<td>
							<input type="text" class="text_input" name="address.zip_code" id="postalCode" value="${address.zip_code}"/>
							<div class="text_left" id="codeValidMsg">
								<p>
									请填写有效的收件人的邮政编码
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							电话
						</td>
						<td>
							<input type="text" class="text_input" name="address.phone" id="phone" value="${address.phone}"/>
							<div class="text_left" id="phoneValidMsg">
								<p>
									请填写有效的收件人的电话
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							手机
						</td>
						<td>
							<input type="text" class="text_input" name="address.mobile" id="mobile" value="${address.mobile}"/>
							<div class="text_left" id="mobileValidMsg">
								<p>
									请填写有效的收件人的手机
								</p>
							</div>
						</td>
					</tr>
				</table>

				<div class="login_in">
					<a href="order_info.jsp">
						<input id="btnClientRegisfter" class="button_1" name="submit" type="submit" value="取消" />
					</a>			
				<input id="btnClientRegister" class="button_1" name="submit" type="submit" value="下一步" />
				</div>
			</form>
		</div>
		<%@include file="../common/foot1.jsp"%>
	</body>
</html>

