<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Gary Yao
  Date: 2017/9/21
  Time: 9:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style type="text/css">
    #select_table{
        width:120px;
    }
    #select_table option{
        width:120px;
    }

    #ban_table{
        width:120px;
    }
    #ban_table option{
        width:120px;
    }
</style>

<script type="text/javascript">
    function log()
    {
        var xmlhttp = new XMLHttpRequest();
        var select = document.getElementById("select_table");
        var index=select.selectedIndex;
        var userID = select.options[index].value;
        if (userID=="0") return;
        xmlhttp.onreadystatechange=function()
        {
            if (xmlhttp.readyState==4 && xmlhttp.status==200)
            {
                document.getElementById("log").innerHTML=xmlhttp.responseText;
            }
        }
        xmlhttp.open("GET","/admin?action=log&&userID="+userID,true);
        xmlhttp.send();

    }
    function ban_log()
    {
        var xmlhttp = new XMLHttpRequest();
        var select = document.getElementById("ban_table");
        var index=select.selectedIndex;
        var userID = select.options[index].value;
        if (userID=="0") return;
        xmlhttp.onreadystatechange=function()
        {
            if (xmlhttp.readyState==4 && xmlhttp.status==200)
            {
                document.getElementById("log").innerHTML=xmlhttp.responseText;
            }
        }
        xmlhttp.open("GET","/admin?action=log&&userID="+userID,true);
        xmlhttp.send();

    }

    function ban() {
        var select = document.getElementById("select_table");
        var index=select.selectedIndex;
        var userID = select.options[index].value;
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.open("GET","/admin?action=ban&&userID="+userID,true);
        xmlhttp.send();
        window.location.reload();

    }
    function remove() {
        var select = document.getElementById("ban_table");
        var index=select.selectedIndex;
        var userID = select.options[index].value;
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.open("GET","/admin?action=remove&&userID="+userID,true);
        xmlhttp.send();
        window.location.reload();
    }

</script>
<html>
<head>
    <title>Admin</title>
</head>
<body>
<center>
<h1>ADMIN</h1>
<h2>Welcome administrator</h2>


<form action="admin" method="post">
    <input type="text" name="userName">
    <input type="submit" value="Search">
    <input type="hidden" name="action" value="ShowUsers">
</form>

<table border="1">
    <tr>
        <td align="center">Active Users</td>
        <td align="center">Banned Users</td>
    </tr>
    <tr>
        <td>ID&nbsp&nbsp&nbsp&nbspUsername</td>
        <td>ID&nbsp&nbsp&nbsp&nbspUsername</td>
    </tr>
    <tr align="center">
        <td align="center">

            <select id="select_table" name="selected_user" size="5" onchange="log()" >
                <%
                    try{
                        ArrayList<ArrayList> name_list = (ArrayList<ArrayList>) request.getAttribute("username");
                        for (ArrayList row: name_list ) {
                            out.append("<option value=\""+row.get(0)+"\">"+row.get(0)+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"+row.get(1)+"</option>");
                        }
                    } catch(Exception e){

                    }
                %>
                <%--<c:forEach var="user_list" items="${pageScope.username}">--%>
                    <%--<c:forEach var="row" items="${user_list}">--%>
                        <%--<option value="${row.get(0)}">${row.get(0)}+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"+${row.get(1)}</option>--%>
                    <%--</c:forEach>--%>
                <%--</c:forEach>--%>



            </select>
        </td>
        <td><select id="ban_table" name="selected_user" size="5" onchange="ban_log()">
            <%--<%--%>
                <%--try{--%>
                    <%--ArrayList<ArrayList> name_list = (ArrayList<ArrayList>) request.getAttribute("ban");--%>
                    <%--for (ArrayList row: name_list ) {--%>
                        <%--out.append("<option value=\""+row.get(0)+"\">"+row.get(0)+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"+row.get(1)+"</option>");--%>
                    <%--}--%>
                <%--} catch(Exception e){--%>

                <%--}--%>
            <%--%>--%>
                <script>
                    window.alert("1")
                </script>
                <c:forEach var="ban_list" items="${ban}">
                    <script>
                        window.alert("2")
                    </script>
                    <c:forEach var="row" items="${ban_list}">
                        <script>
                            window.alert("3")
                        </script>
                        <option value="${row.get(0)}">${row.get(0)}+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"+${row.get(1)}</option>
                    </c:forEach>
                </c:forEach>
        </select>
        </td>
    </tr>
    <tr>
        <td align="center"><input type="button" value="Ban" onclick="ban()"></td>
        <td align="center"><input type="button" value="Remove" onclick="remove()"></td>
    </tr>

</table>

<p>log:</p>
<table id="log">

</table>
</center>
</body>
</html>
