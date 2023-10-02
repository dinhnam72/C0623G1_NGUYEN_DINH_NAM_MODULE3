<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 9/29/2023
  Time: 11:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create</title>
</head>
<body>
<form action="/user?action=create" method="post">
  <table>
    <tr>
      <td>Tên:</td>
      <td><input type="text" name="name"></td>
    </tr>
    <tr>
      <td>Email:</td>
      <td><input type="email" name="email"></td>
    </tr>
    <tr>
      <td>Địa chỉ:</td>
      <td><input type="text" name="country"></td>
    </tr>
  </table>
  <button type="submit">Gửi</button>
</form>
</body>
</html>
