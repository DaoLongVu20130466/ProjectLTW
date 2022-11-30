<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<h2>Hello World!</h2>
<%
     String a = (String) request.getAttribute("error");
     String z =  request.getParameter("id");
    if(a == null) a="" ;
    if(z==null) z="";
%>
<p><%=a%></p>
<form action="http://localhost:8080/login_war/Servlet" method="post">
    <label name="danger" >abx</label>
    user:<input type="text" name="id" value=<%=z%>>
    pass:<input type="password" name="pass">
    <button>check</button>
</form>
</body>
</html>
