<%@page contentType="text/html;charset=utf-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="page" />
<html>
<head>
   <script type="text/javascript">
       window.parent.location.href='${path}/back/login.jsp';
   </script>

</head>

