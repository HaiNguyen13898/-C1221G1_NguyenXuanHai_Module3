<%--
  Created by IntelliJ IDEA.
  User: T470s
  Date: 4/15/2022
  Time: 9:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View product</title>
</head>
<body>
<h1>Product details</h1>
<p>
    <a href="/products">Back to product list</a>
</p>
<table border="1">
    <tr>
        <td>Name: </td>
        <td>${"product".nameProduct}</td>
    </tr>
    <tr>
        <td> Price: </td>
        <td>${"product".priceProduct}</td>
    </tr>
    <tr>
        <td> Manufacturer: </td>
        <td>${"product".facilitiesProduct}</td>
    </tr>
</table>
</body>
</html>
