<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>

<form action="/servlet" method="post">
    <table>
        <tr>
            <td><label for="productPescription">Product Description</label></td>
            <td><input type="text" id="productPescription" name="productPescription"></td>
        </tr>
        <tr>
            <td><label for="listPrice">List Price</label></td>
            <td><input type="number" id="listPrice" name="listPrice"></td>
        </tr>
        <tr>
            <td><label for="discountPercent">Discount Percent</label></td>
            <td><input type="number" id="discountPercent" name="discountPercent"></td>
        </tr>

    </table>
    <button type="submit">Calculate Discount</button>
</form>
</body>

</html>