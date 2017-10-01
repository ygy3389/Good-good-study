<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kevifunaumac
  Date: 2017/10/1
  Time: 下午9:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="helper.js"></script>

</head>
<body>

<%@include file="header.jsp"%>





<form action="findfriends" method="get">
    <table  class="table">
        <tr>
            <td>userName</td>
            <td>email</td>
            <td>gender</td>
            <td>u_year</td>
            <td>u_month</td>
            <td>u_day</td>
        </tr>
        <tr>
            <td><input type="text" name="userName"></td>
            <td><input type="text" name="email"></td>
            <td><input type="text" name="gender"></td>
            <td><input type="text" name="u_year"></td>
            <td><input type="text" name="u_month"></td>
            <td><input type="text" name="u_day"></td>
        </tr>
        <input type="submit" value="Advance search">

    </table>
</form>



<div class="container">
    <div class="top">
        <h2>People you may know</h2>
    </div>
    <div class="row">
        <div class="shadow">
            <c:forEach var="u" items="${findfriend_list.list}">
                <div class="col-sm-12">
                    <div class="col-sm-2">
                        <img class="img-circle" width="60px">
                    </div>

                    <div class="col-sm-8">
                        <h4><a href="#">${u}</a></h4>
                        <p>${u}</p>
                    </div>
                    <div class="col-sm-2">
                        <br>
                        <button type="button" onclick="addfriend(${u})">Add friend </button>
                    </div>
                </div>
                <div class="clearfix"></div>
                <hr />
            </c:forEach>

        </div>
    </div>
</div>





<script type="text/javascript">
    function addfriend(friend_id) {
        var req = getXMLHttpRequest();
        req.onreadystatechange = function ()
        {

            if(req.readyState == 4)
            {
                if(req.status == 200)
                {
                    alert(req.responseText);

                }
            }
        }
        req.open("get", "addfriend?friend_id=" + friend_id);
        req.send(null);
    }
</script>






</body>
</html>
