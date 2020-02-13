<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/back/css/btn.css" />
	</head>
	<body style="background-color: #f0f9fd;text-align: center;">
	
		<div style="font-size:25px">类别管理</div><hr/>
		<div style="margin-bottom: 10px;">
			<div class="button btn-p" onclick="location.href='${pageContext.request.contextPath }/back/category/add-first.jsp'">添加一级类别&raquo;</div>
			<div class="button btn-p" onclick="location.href='${pageContext.request.contextPath }/category/queryAllOne'">添加二级类别&raquo;</div>
		</div>
		<table bordercolor='#898E90' align='center' border='3px' cellpadding='10px' cellspacing="0px" >
			<tr bgcolor='lightblue'>
				<td>Id</td>
				<td>类别名</td>
				<td>所属类别</td>
				<td>级别</td>
				<td>操作</td>
			</tr>
			
			<c:forEach items="${requestScope.categoryList}" var="list">
			
			<tr>
				<td>${list.id }</td>
				<td>${list.cateName}</td>
				<td></td>
				<td>${list.levels}</td>
				<%--<td><c:if test="${list.category.size() ==0}">
					<div class="button" onclick="location.href='${pageContext.request.contextPath }/delete?id=${list.id }'">删除 &raquo;</div>
				</c:if></td>--%>
			</tr>
			<%--<c:forEach var="d" items="${list.category }">
			<tr>
				<td>${d.id }</td>
				<td>${d.cateName }</td>
				<td>${list.cateName }</td>
				<td>${d.levels }</td>
				<td><c:if test="${list.category.size() !=0}">
					<div class="button" onclick="location.href='${pageContext.request.contextPath }/delete?id=${d.id }'">删除 &raquo;</div>	
				</c:if>
				</td>
			</tr>
			</c:forEach>--%>
			</c:forEach>
			
			
			
		</table><br/>
		
	</body>  
</html>



