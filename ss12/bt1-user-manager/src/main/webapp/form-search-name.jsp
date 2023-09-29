<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 9/29/2023
  Time: 2:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Search By Country</title>
</head>
<body>
<form action="/user?action=search" method="post">
    Nhập địa chỉ cần tìm:
    <input type="text" name="country">
    <button type="submit">Tìm kiếm</button>
</form>
<table border="1px" style="border: aquamarine; width: 40%; text-align: center" >
    <thead>
    <tr>
        <th colspan="4">Danh sách người dùng</th>
    </tr>
    <tr>
        <th>STT</th>
        <th>Tên</th>
        <th>Email</th>
        <th>Địa chỉ</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="list" varStatus="look">
        <tr>
            <td>${look.count}</td>
            <td>${list.name}</td>
            <td>${list.email}</td>
            <td>${list.country}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
