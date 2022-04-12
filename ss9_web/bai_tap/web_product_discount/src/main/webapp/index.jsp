<%--
  Created by IntelliJ IDEA.
  User: T470s
  Date: 4/12/2022
  Time: 7:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<form method="post" action="/ProductDiscount">
    <label> Product Description: </label>
    <input type="text" size="30" name="product-name" placeholder="Mô tả sản phẩm"> <br>
    <label> List Price: </label>
    <input type="text" name="product-price" size="30" placeholder="Giá niêm yết của sản phẩm"> <br>
    <label>Discount Percent: </label>
    <input type="text" name="product-discount" size="30" placeholder="Tỷ lệ chiết khấu (phần trăm)"><br>
    <input type="submit" id="submit" value="Discount product">
</form>


</body>
</html>
