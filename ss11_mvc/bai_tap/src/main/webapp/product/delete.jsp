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
    <title>Title</title>
</head>
<body>
<h1>Delete product</h1>
<p>
    <a href="/products">Back to products list</a>
</p>
<form method="post">
    <h3>Are you sure?</h3>
    <table>
        <tr>
            <td>Name:</td>
            <td>${product.getNameProduct()}</td>
        </tr>
        <tr>
            <td>Price:</td>
            <td>${product.getPriceProduct()}</td>
        </tr>
        <tr>
            <td>Manufacture:</td>
            <td>${product.getFacilitiesProduct()}</td>
        </tr>
        <tr>
            <td><input type="submit" value="Delete product"></td>
        </tr>
    </table>

</form>
</body>
</html>
