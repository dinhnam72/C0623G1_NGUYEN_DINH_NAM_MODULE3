<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 9/28/2023
  Time: 3:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product</title>
</head>
<body>
<a href=""></a>
<table border="1px">
    <thead>
    <tr>
        <th colspan="7">
            <h2>Quản Lý Sản Phẩm</h2>
        </th>

    </tr>
    <tr>
        <th>STT</th>
        <th>Tên</th>
        <th>Giá</th>
        <th>Ngày sản xuất</th>
        <th>Hạn sử dụng</th>
        <th colspan="2">Chức năng</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${productList}" var="product" varStatus="look">
        <tr>
            <td>${look.count}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.productionDate}</td>
            <td>${product.expirationDate}</td>
            <td>
                <a href="?action=edit&id=${product.id}">Sửa</a>
            </td>
            <td>
                <a href="?action=remove&id=${product.id}">Xóa</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div>
    <a href="form_add.jsp">Thêm sản phẩm</a><br>
    <a href="form_detail.jsp">Thông tin chi tiết sản phẩm</a><br>
    <a href="form_search.jsp">Tìm kiếm sản phẩm theo tên</a>
</div>
</body>
</html>
