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
    <title> List product</title>
</head>
<body>
<h1>Products</h1>
<p>
    <a href="/products?action=create"> Create new product </a>
</p>
<table border="2">
    <tr>
        <td>Name</td>
        <td>Price</td>
        <td>Manufacturer</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>

        <c:forEach items='${products}' var="product">
    <tr>
        <td><a href="/products?action=view&id=${product.idProduct}">${product.nameProduct}</a></td>
        <td>${product.priceProduct}</td>
        <td>${product.facilitiesProduct}</td>
        <td><a href="/products?action=edit&id=${product.idProduct}">edit</a></td>
        <td><a href="/products?action=delete&id=${product.idProduct}">delete</a></td>
    </tr>
    </c:forEach>

</table>
</body>
</html>
