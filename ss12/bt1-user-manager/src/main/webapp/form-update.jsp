<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 9/29/2023
  Time: 11:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update</title>
</head>
<body>
<form action="/user?action=update" method="post">
    <table>
        <tr>
            <td>Id:</td>
            <td><input type="int" name="id" value="${user.id}"></td>
        </tr>
        <tr>
            <td>Tên:</td>
            <td><input type="text" name="name" value="${user.name}"></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><input type="email" name="email" value="${user.email}"></td>
        </tr>
        <tr>
            <td>Địa chỉ:</td>
            <td><input type="text" name="country" value="${user.country}"></td>
        </tr>
    </table>
    <button type="submit">Gửi</button>
</form>

</body>
</html>
