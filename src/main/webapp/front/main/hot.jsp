<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<h2>
	<span class="more"><a href="#" target="_blank">更多&gt;&gt;</a> </span>热销图书
</h2>
<div class="book_c_04">

	<!--热销图书A开始-->
	<c:forEach items="${sessionScope.selectdcount}" var="list">
	<div class="second_d_wai">
	
		<div class="img">
			<a href="${path }/book/jfosd?id=${list.id}" target='_blank'>
				<img class="zoom" src="${path }/back/img/${list.src }" border=0 /> 
			</a>
		</div>
		<div class="shuming">
			<a href="${path }/book/jfosd?id=${list.id}" target="_blank">${list.bname }</a><a href="#" target="_blank"></a>
		</div>
		<div class="price">
			定价：${list.price }
		</div>
		<div class="price">
			当当价：${list.dprice }
		</div>
		<div class="price">
			销量：<font color="red">${list.dcount }</font>
		</div>
		
	</div>
	</c:forEach>
	<div class="book_c_xy_long"></div>
	<!--热销图书A结束-->

</div>
<div class="clear"></div>