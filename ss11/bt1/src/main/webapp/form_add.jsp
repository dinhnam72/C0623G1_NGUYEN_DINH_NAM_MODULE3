<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 9/28/2023
  Time: 11:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>From Add</title>
</head>
<body>
<form action="/?action=create" method="post">
  <table>
    <tr>
      <td>Id</td>
      <td><input type="number" name="id" required></td>
    </tr>
    <tr>
      <td>Tên</td>
      <td><input type="text" name="name" required></td>
    </tr>
    <tr>
      <td>Giá</td>
      <td><input type="number" name="price" required></td>
    </tr>
    <tr>
      <td>Ngày sản xuất</td>
      <td><input type="text" name="productionDate"></td>
    </tr>
    <tr>
      <td>Hạn sử dụng</td>
      <td><input type="text" name="expirationDate"></td>
    </tr>
  </table>
  <button type="submit" name="create">Thêm </button>
</form>

</body>
</html>
