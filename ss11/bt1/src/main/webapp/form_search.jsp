<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 9/28/2023
  Time: 9:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Search By Name</title>
</head>
<body>
<form action="/?action=searchByName" method="post">
    Nhập tên sản phẩm: <input type="text" name="name">
    <button type="submit">Search</button>

    <table border="1px">
        <thead>
        <tr>
            <th>Id</th>
            <th>Tên</th>
            <th>Giá</th>
            <th>Ngày sản xuất</th>
            <th>Hạn sử dụng</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${products}" var="p">
            <tr>
                <td>${p.id}</td>
                <td>${p.name}</td>
                <td>${p.price}</td>
                <td>${p.productionDate}</td>
                <td>${p.expirationDate}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</form>
</body>
</html>
