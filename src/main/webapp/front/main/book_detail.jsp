<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
	<head>
		<title>图书详情</title>
		<link rel="stylesheet" type="text/css" href="${path }/css/book_detail.css"/>
		<link href="${path }/front/css/public_footer.css" rel="stylesheet" type="text/css" />

	</head>
	<body>
		<br/>
		<div>
			<a href="${path }/front/main/main.jsp">回到首页</a>
			<h1>
				丛书名：${book.bname }
			</h1>
			<hr/>
		</div>
		<table width="80%" border="0" align="center" cellspacing="0" cellpadding="5">
			<tr>
				<td rowspan="9" width="20%" valign="top"><img class="zoom" src="${path }/back/img/${book.src }" width="240px" height="340px" /></td>
				<td colspan="2">作者：${book.author }></td>
			</tr>
			<tr>
				<td colspan="2">出版社：${book.company }</td>
			</tr>
			<tr>
				<td>出版时间：<fmt:formatDate value="${book.pressDate}" pattern="yyyy-MM-dd"/> </td>
				<td>字数：${book.wordNum }</td>
			</tr>
			<tr>
				<td>版次：${book.edition }</td>
				<td>页数：${book.pagenum }</td>
			</tr>
			<tr>
				<td>印刷时间：<fmt:formatDate value="${book.printDime}" pattern="yyyy-MM-dd"/></td>
				<td>开本：${book.bsize}</td>
			</tr>
			<tr>
				<td>印次：${book.impression }</td>
				<td>纸张：${book.paper }</td>
			</tr>
			<tr>
				<td>ISBN：${book.isbn }</td>
				<td>销量：<font color="red">${book.dcount }</font></td>
			</tr>
			<tr>
				<td>所属类别：<font style='color: #cc3300'><strong>小说	</strong>&gt;&gt;${requestScope.category.cateName }</font>
				
			</tr>
			<tr>
				<td colspan="2">定价：${book.price }￥&nbsp;&nbsp;&nbsp;&nbsp;
				<font color="red">当当价：${book.dprice }￥</font>&nbsp;&nbsp;&nbsp;&nbsp;
				节省：￥${book.price -book.dprice}</td>
			</tr>
			<tr>
				<td colspan="2">
					<a href="${path}/cart/add?bookId=${book.id}">
						<img src='${path }/front/images/buttom_goumai.gif' />
					</a>
				</td>
			</tr>
		</table>
		<hr style="border:1px dotted #666"/>
		<h2>编辑推荐</h2>${book.editorRecommend }
		<p>&nbsp;&nbsp;</p>
		<hr style="border:1px dotted #666"/>
		<h2>内容简介</h2>${book.contentAbstortact }
		<p>&nbsp;&nbsp;</p>
		<hr style="border:1px dotted #666"/>
		<h2>作者简介</h2>${book.authorAbstract }
		<p>&nbsp;&nbsp;</p>
		<hr style="border:1px dotted #666"/>
		<h2>目录</h2>${book.driector }
		<p>&nbsp;&nbsp;</p>
		<hr style="border:1px dotted #666"/>
		<h2>媒体评论</h2>${book.mediacomentary }
		<p>&nbsp;&nbsp;</p>
		<hr style="border:1px dotted #666"/>
		<h2>书摘插图</h2>
		<p>&nbsp;&nbsp;</p>
		<!--页尾开始 -->
		<div class="public_footer">
			<div class="public_footer_bottom">
				<div class="public_footer_icp" style="line-height: 48px;">
					Copyright (C) 当当网 2004-2008, All Rights Reserved
					<a href="#" target="_blank"><img src="${path }/front/images/bottom/validate.gif" border="0" align="middle" /> </a>
					<a href="#" target="_blank" style="color: #666;">京ICP证041189号</a>
				</div>
			</div>
		</div>
		<!--页尾结束 -->
	</body>
</html>
