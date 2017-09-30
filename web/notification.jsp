<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="org.w3c.dom.*"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="main.control.LikePostServlet" %>
<%@ page import="java.util.List" %>
<%@ page import="main.model.postMessageBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script>
        function dosomething(a){

            alert("has read this message!"+a)
        }
    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <title>notification</title>
</head>
<body>
<div class="container" id="wrap">
    <logo>UNSWBOOk</logo>
    </br>
    <jsp:useBean  id="ad" class="comp9321.notific" />
    <%
        request.getSession().setAttribute("userid",2);
        int userid=(Integer) (request.getSession().getAttribute("userid"));

        List str=ad.getstr(userid);
        request.setAttribute("uList",str);

    %>
<c:forEach items="${uList}" var="info">
    ${info}
    <button id="item" onclick="dosomething('${uList.indexOf(info)}')">read</button>
    <br>
</c:forEach>

</div>
</body>
</html>