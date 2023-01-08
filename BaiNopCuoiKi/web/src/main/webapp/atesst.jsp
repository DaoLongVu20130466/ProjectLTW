<%@ page import="main.bean.User" %><%--
  Created by IntelliJ IDEA.
  User: thoai
  Date: 8/01/2023
  Time: 9:25 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<H1>
  <%

      User userID = (User) session.getAttribute("auth");

  %>
    <%=userID.getUserId()%>
</H1>

</body>
</html>
