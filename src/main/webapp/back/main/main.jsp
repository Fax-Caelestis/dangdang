<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<script type="text/javascript" src="${path}/front/js/jquery-1.8.3.min.js">
</script>


</head>
<frameset rows="150,*" noresize="true" border="2px" bordercolor="#9A9D9F">
	<frame src="head.jsp">
	<frameset cols="15%,*">
		<frame src="menu.jsp" />
		<frame name="Homepage" src="home.jsp">
	</frameset>
</frameset>
</html>