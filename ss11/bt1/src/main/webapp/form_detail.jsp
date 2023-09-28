<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 9/28/2023
  Time: 7:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detail</title>
</head>
<body>
<form action="/?action=detail" method="post" >
  Nhập id sản phẩm: <input type="number" name="number">
  <button type="submit" name="search">Search</button>
  <table border="1px">
    <tr>
      <th>Id</th>
      <th>Tên</th>
      <th>Giá</th>
      <th>Ngày sản xuất</th>
      <th>Hạn sử dụng</th>
    </tr>
    <tr>
      <td>${product.id}</td>
      <td>${product.name}</td>
      <td>${product.price}</td>
      <td>${product.productionDate}</td>
      <td>${product.expirationDate}</td>
    </tr>
  </table>
  <a href="list.jsp">Home</a>
</form>
</body>
</html>
