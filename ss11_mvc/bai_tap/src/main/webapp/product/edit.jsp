<%--
  Created by IntelliJ IDEA.
  User: T470s
  Date: 4/15/2022
  Time: 9:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>
    <c:if test='${"message" != null}'>
        <span class="message">${"message"}</span>
    </c:if>
</p>
<p>
    <a href="/products">Back to product list</a>
</p>
<form method="post">
    <table>
        <tr>
            <td>Name:</td>
            <td><input type="text" name="name" id="name" value="${product.getNameProduct()}"></td>
        </tr>
        <tr>
            <td>Price:</td>
            <td><input type="text" name="price" id="price" value="${product.getPriceProduct()}"></td>
        </tr>
        <tr>
            <td>Manufacture:</td>
            <td><input type="text" name="facilitiesProduct" id="facilitiesProduct"
                       value="${product.getFacilitiesProduct()}"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Update product"></td>
        </tr>
    </table>
</form>

</body>
</html>
