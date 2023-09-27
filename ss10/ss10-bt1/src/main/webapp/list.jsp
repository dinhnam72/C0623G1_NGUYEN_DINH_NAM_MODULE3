<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 9/27/2023
  Time: 11:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="" ></a>
<table border="1px"  style="width: 50%;text-align: center ">
  <thead>
  <tr>
    <th colspan="4">
      <h2>Danh Sách Khách Hàng</h2>
    </th>
  </tr>
  <tr>
    <th>Tên</th>
    <th>Ngày Sinh</th>
    <th>Địa Chỉ</th>
    <th>Ảnh</th>
  </tr>
  </thead>

  <tbody>
  <c:forEach items="${customerList}" var="c" >
    <tr>
      <td>${c.name}</td>
      <td>${c.birth}</td>
      <td>${c.address}</td>
      <td><img style="width: 150px;height: 100px" src="${c.picture}"></td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</body>
</html>
