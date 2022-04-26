
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create product</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>
<nav class="row navbar navbar-light bg-light">
    <a class="navbar-brand" href="#">
        <img src="data:image/png;base64,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"
             width="200px"
             alt="">
    </a>
    <p>NGUYỄN XUÂN HẢI</p>
</nav>

<nav class="navbar navbar-light ">
    <nav class="navbar navbar-expand-lg navbar-light">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="http://localhost:8080/">Home<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="/products">Product<span class="sr-only">(current)</span></a>
                </li>
            </ul>
        </div>

    </nav>
    <form class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
</nav>

<center>
    <h1>Product management</h1>
    <a href="/products">Back to customer list</a>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>Create product</h2>
            </caption>
            <tr>
                <th>Product name: </th>
                <td>
                    <input type="text" name="name_product" />
                </td>
            </tr>
            <tr>
                <th>Price: </th>
                <td>
                    <input type="number" name="price" />
                </td>
            </tr>
            <tr>
                <th>Quantity: </th>
                <td>
                    <input type="text"  name="quantity" >
                </td>
            </tr>
            <tr>
                <th>Color </th>
                <td>
                    <select name="color" >
                        <option value="red">red</option>
                        <option value="green">green</option>
                        <option value="yellow">yellow</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Category </th>
                <td>
                    <select name="id_category">
                        <c:forEach var="category" items="${categoryList}">
                            <option value=${category.getIdCategory()}>${category.getNameCategory()}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

</body>
</html>
