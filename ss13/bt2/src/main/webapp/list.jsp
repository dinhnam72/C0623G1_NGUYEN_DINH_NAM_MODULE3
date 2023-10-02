<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 9/29/2023
  Time: 10:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List</title>
</head>
<body>
<table border="1px" style="border: aquamarine; width: 40%; text-align: center">
    <thead>
    <tr>
        <th colspan="6">Danh sách người dùng</th>
    </tr>
    <tr>
        <th>STT</th>
        <th>Tên</th>
        <th>Email</th>
        <th>Địa chỉ</th>
        <th colspan="2">Chức năng</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${userList}" var="u" varStatus="look">
        <tr>
            <td>${look.count}</td>
            <td>${u.name}</td>
            <td>${u.email}</td>
            <td>${u.country}</td>
            <td><a href="/user?action=update&id=${u.id}">Sửa</a></td>
            <td><a href="/user?action=remove&id=${u.id}">Xóa</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<a href="form-create.jsp">
    <h3>Thêm người dùng</h3>
</a><br>

<a href="form-search-name.jsp">
    <h3>Tìm kiếm theo địa chỉ</h3>
</a><br>

<a href="index.jsp">
    <h3>Trang chủ</h3>
</a>
</body>
</html>
