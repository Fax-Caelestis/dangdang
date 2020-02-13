<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>当当图书 – 全球最大的中文网上书店</title>
		<link href="${path }/front/css/book.css" rel="stylesheet" type="text/css" />
		<link href="${path }/front/css/second.css" rel="stylesheet" type="text/css" />
		<link href="${path }/front/css/secBook_Show.css" rel="stylesheet" type="text/css" />
		<link href="${path }/front/css/list.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${path }/front/js/prototype-1.6.0.3.js"></script>
	</head>
	<body>
		&nbsp;

		<!-- 头部开始 -->
		<%@include file="../common/head.jsp"%>
		<!-- 头部结束 -->

		<div style="width: 962px; margin: auto;">
			<a href="#"><img src="${path }/front/images/default/book_banner_081203.jpg" border="0" /> </a>
		</div>
		<div class='your_position'>
			您现在的位置:&nbsp;
			<a href='${path }/book/main'>当当图书</a> &gt;&gt;
			<c:forEach items="${sessionScope.list3}" var="list">
			
			<font style='color: #cc3300'><strong><c:if test="${fid==list.id}" >${list.cateName}</c:if> </strong></font>
				<c:forEach items="${list.category}" var="c">
				
			<font style='color: #cc3300'><strong><c:if test="${sid==c.id}" >${c.cateName }</c:if> </strong> </font>
				</c:forEach>
			</c:forEach>
		</div>

		<div class="book">

			<!--左栏开始-->
			<div id="left" class="book_left">
				<div id="__fenleiliulan">
					<div class=second_l_border2>
						<h2>
							分类浏览
						</h2>
						<ul>
							<li>
								<div>
									<div class=second_fenlei>
										
										<a href='${path }/book/selectCategorys?fid=${fid}'><font <c:if test="${s.id==null }"> style='color: #cc3300'</c:if>>全部&nbsp;</font></a>
									
									</div>
								</div>
							</li>
							<div class="clear"></div>
							
							<!--2级分类开始-->
							<c:forEach items="${list4}" var="list">
							<li>
								<div>
									<div class=second_fenlei>
										&middot;
									</div>
									<c:forEach items="${list.category}" var="l">
									<div class=second_fenlei>
										<a href='${path }/book/selectCategorys?sid=${l.id}&fid=${list.id}'>
											<font <c:if test="${sid==l.id}"> color="red"</c:if>>
												${l.cateName }
											</font>
										&nbsp;</a>
									</div><br/>
									</c:forEach>
								</div>
							</li>
							<div class="clear"></div>
							<!--2级分类结束-->
							</c:forEach>
							<li>
								<div></div>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<!--左栏结束-->

			<!--中栏开始-->
			<div class="book_center">

				<!--图书列表开始-->
				<div id="divRight" class="list_right">

					<div id="book_list" class="list_r_title">
						<div class="list_r_title_text">
							排序方式
						</div>
						<select onchange='' name='select_order' size='1'
							class='list_r_title_ml'>
							<option value="">
								按上架时间 降序
							</option>
						</select>
						<div id="divTopPageNavi" class="list_r_title_text3">

							<!--分页导航开始-->
							<c:if test="${page.pagenumber>1}">
								<div class='list_r_title_text3a'>
									<a name=link_page_next href="${pageContext.request.contextPath}/book/selectCategorys?fid=${fid}&page.pagenumber=${page.pagenumber-1} <c:if test="${sid!=null}">&sid=${sid}</c:if>">
										<img src='${pageContext.request.contextPath}/front/images/page_up.gif' />
									</a>
								</div>
								</c:if>
								<c:if test="${page.pagenumber<=1}">
								<div class='list_r_title_text3a'>
									<img src='${path}/front/images/page_up_gray.gif' />
								</div>
								</c:if>
								<div class='list_r_title_text3b'>
								第<font color="red">${page.pagenumber}</font>页/共<font color="red">${page.pagecount}</font>页
								</div>
								<c:if test="${page.pagenumber<page.pagecount}">
								<div class='list_r_title_text3a'>
									<a name=link_page_next href="${pageContext.request.contextPath}/book/selectCategorys?fid=${fid}&page.pagenumber=${page.pagenumber+1} <c:if test="${sid!=null}">&sid=${sid}</c:if>">
										<img src='${path}/front/images/page_down.gif' />
									</a>
								</div>
								</c:if>
							<c:if test="${pagenumber==page.pagecount}">
								<div class='list_r_title_text3a'>
									<img src='${path}/front/images/page_down_gray.gif' />
								</div>
							</c:if>
							
							
							

							<!--分页导航结束-->
						</div>
					</div>
					
					<!--商品条目开始-->
					 	<c:forEach items="${requestScope.list}" var="list">
						<div class="list_r_line"></div>
						<div class="clear"></div>
							<div class="list_r_list">
								<span class="list_r_list_book">
									<a name="link_prd_img" href='#'>
										<img src="${path }/front/productImages/1.jpg" /> 
									</a>
								</span>
								<h2>
									<a name="link_prd_name" href='#'>${list.bname }</a>
								</h2>
								<h3>
									顾客评分：${list.editorRecommend }
								</h3>
								<h4 class="list_r_list_h4">
									作 者:
									<a href='#' name='作者'>${list.author }</a>
								</h4>
								<h4>
									出版社：
									<a href='#' name='出版社'>${list.company }</a>
								</h4>
								<h4>
									出版时间：<fmt:formatDate value="${book.pressDate}" pattern="yyyy-MM-dd"/> </td>
								</h4>
								<h5>
									${list.contentAbstortact }
								</h5>
								<div class="clear"></div>
								<h6>
									原价：<span class="del">${list.price }</span>
									当当价：<span class="red">${list.dprice }</span>
									节省：${list.price- list.dprice}
								</h6>
								<span class="list_r_list_button"> 
								<a href="${path}/cart/add?bookId=${list.id}"> 
									<img src='${path }/front/images/buttom_goumai.gif' /> 
								</a>
								<span id="cartinfo"></span>
							</div>
						<div class="clear"></div>

						</c:forEach>
					 
						<!--商品条目结束-->

					<div class="clear"></div>
					<div id="divBottomPageNavi" class="fanye_bottom">
					</div>

				</div>
				<!--图书列表结束-->

			</div>
			<!--中栏结束-->
			<div class="clear"></div>
		</div>

		<!--页尾开始 -->
		<%@include file="../common/foot.jsp"%>
		<!--页尾结束 -->
	</body>
</html>
