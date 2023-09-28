<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 9/28/2023
  Time: 2:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit</title>
</head>
<body>
<form method="post" action="/?action=edit">
  <table>
    <tr>
      <td>Id</td>
      <td><input type="number" name="id" value="${product.id}"></td>
    </tr>
    <tr>
      <td>Tên</td>
      <td><input type="text" name="name" value="${product.name}"></td>
    </tr>
    <tr>
      <td>Giá</td>
      <td><input type="number" name="price" value="${product.price}"></td>
    </tr>
    <tr>
      <td>Ngày sản xuất</td>
      <td><input type="text" name="productionDate" value="${product.productionDate}"></td>
    </tr>
    <tr>
      <td>Hạn sử dụng</td>
      <td><input type="text" name="expirationDate" value="${product.expirationDate}"></td>
    </tr>
  </table>
  <button type="submit" name="edit" >Sửa</button>
</form>
</body>
</html>
