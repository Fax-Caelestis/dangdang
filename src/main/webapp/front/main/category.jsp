<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<div class="book_l_border1" id="__FenLeiLiuLan">
	<div class="book_sort_tushu">
		<h2>
			分类浏览
		</h2>
		
		<!--1级分类开始-->
			<c:forEach items="${sessionScope.list3}" var="list">
			
			<div class="bg_old" onmouseover="this.className = 'bg_white';"
				onmouseout="this.className = 'bg_old';">
				<h3>
					<a href='${path }/book/selectCategorys?fid=${list.id}'>${list.cateName }</a>
				</h3>
				<ul class="ul_left_list">

						<!--2级分类开始-->
						<c:forEach items="${list.category}" var="list2">
						<li>
							<a href='${path }/book/selectCategorys?sid=${list2.id}&fid=${list.id}'>${list2.cateName }</a>
						</li>
						<!--2级分类结束-->
						</c:forEach>

				</ul>
				<div class="empty_left">
				</div>
			</div>

			<div class="more2">
			</div>
			</c:forEach>
		<!--1级分类结束-->
		


		<div class="bg_old">
			<h3>
				&nbsp;
			</h3>
		</div>
	</div>
</div>
