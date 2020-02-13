<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h2>
	编辑推荐
</h2>
<div id=__bianjituijian/danpin>
	<div class=second_c_02>
<c:forEach items="${sessionScope.selecttj}" var="list">
		<!--编辑推荐图书开始-->
		<div class=second_c_02_b1>
			
			<div class=second_c_02_b1_1>
				<a href='${path }/book/jfosd?id=${list.id}' target='_blank'>
					<img class="zoom" src="${path }/back/img/${list.src }" width=70 border=0 /> 
				</a>
			</div>
			<div class=second_c_02_b1_2>
				<h3>
					<a href='${path }/book/jfosd?id=${list.id}' target='_blank' title='输赢'> ${list.bname }</a>
				</h3>
				<h4>
					作者：${list.author } 著
					<br/>
					出版社：${list.company }&nbsp;&nbsp;&nbsp;&nbsp;
					出版时间：<fmt:formatDate value="${list.pressDate}" pattern="yyyy-MM-dd"/> </td>
				</h4>
				<h5>
					简介 ${list.contentAbstortact }
				</h5>
				<h6>
					定价：￥${list.price }&nbsp;&nbsp;
					当当价：￥${list.dprice }
					销量：<font color="red">${list.dcount }</font>
				</h6>
				<div class=line_xx></div>
			</div>
		</div>
		</c:forEach>
		
		<!--编辑推荐图书结束-->
	</div>
</div>
