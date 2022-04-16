<%--
  Created by IntelliJ IDEA.
  User: T470s
  Date: 4/15/2022
  Time: 9:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new product</title>
    <style>
        .message {
            color: brown;
        }
    </style>
</head>
<body>
<h1>Create new product</h1>
<p>
    <c:if test="${message !=null}">
        <span class="message">${message}</span>
    </c:if>
</p>
<p>
    <a href="/products">Back to product list</a>
</p>
<form method="post">
    <p>Product information</p>
    <table border="2">
        <tr>
            <td>Name: </td>
            <td><input type="text" name="name" id="name"> </td>
        </tr>
        <tr>
            <td>Price: </td>
            <td><input type="text" name="price" id="price"></td>
        </tr>
        <tr>
            <td>Manufacturer: </td>
            <td><input type="text" name="manufacture" id="manufacture"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Create product"></td>
        </tr>
    </table>

</form>
</body>
</html>
