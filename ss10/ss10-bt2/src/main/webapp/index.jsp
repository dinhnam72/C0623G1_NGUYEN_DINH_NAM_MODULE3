<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Calculator</title>
</head>
<body>
<h1>Symble Calculator</h1>
<br/>
<%--<a href="/calculator-servlet">Hello Servlet</a>--%>
<form action="/calculator-servlet" method="post">
    <table>
        <tr>
            <td>First operand:</td>
            <td><input type="number" name="firstOperand" value="${firstOperand}" ></td>
        </tr>
        <tr>
            <td>Operator:</td>
            <td>
                <select name="calculation" >
                    <option value="add">add</option>
                    <option value="subtract">subtract</option>
                    <option value="multiply">multiply</option>
                    <option value="division">division</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Second operand:</td>
            <td><input type="number" name="secondOperand" value="${secondOperand}"></td>
        </tr>
        <tr>
            <td colspan="2">
                <button type="submit">Calculate</button>
            </td>
        </tr>
    </table>
    <p>Result: ${result}</p>

</form>
</body>
</html>