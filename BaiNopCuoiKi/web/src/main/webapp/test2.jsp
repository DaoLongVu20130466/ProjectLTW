<%--
  Created by IntelliJ IDEA.
  User: thoai
  Date: 16/02/2023
  Time: 9:39 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  String a = (String) request.getAttribute("a");
    String b = (String) request.getAttribute("b");
%>
<img src="<%=a%>">
<%=b%>



</body>
</html>
