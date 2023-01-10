<%--
  Created by IntelliJ IDEA.
  User: thoai
  Date: 9/01/2023
  Time: 8:55 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
        <%
            String a = (String) request.getAttribute("1");
            String b = (String) request.getAttribute("2");
            int c = (int) request.getAttribute("3");
            String d = (String) request.getAttribute("4");
            int e = (int) request.getAttribute("5");
            String f = (String) request.getAttribute("6");
            int g = (int) request.getAttribute("7");
            String h = (String) request.getAttribute("8");
            String j = (String) request.getAttribute("9");
            String k = (String) request.getAttribute("10");
            String l = (String) request.getAttribute("11");
            int m = (int) request.getAttribute("12");

 %>
<h1> <%=a%></h1>
        <h1> <%=b%></h1>
        <h1> <%=c%></h1>
        <h1> <%=d%></h1>
        <h1> <%=e%></h1>
        <h1> <%=f%></h1>
        <h1> <%=g%></h1>
        <h1> <%=h%></h1>
        <h1> <%=j%></h1>
        <h1> <%=k%></h1>
        <h1><%=l%></h1>
        <h1> <%=m%></h1>



</body>
</html>
