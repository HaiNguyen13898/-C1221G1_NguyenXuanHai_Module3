
<%--
  Created by IntelliJ IDEA.
  User: T470s
  Date: 4/20/2022
  Time: 10:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create customer</title>
</head>
<body>
<center>
    <h1>Customer management</h1>
    <a href="/customers">Back to customer list</a>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>Create User</h2>
            </caption>
            <tr>
                <th>Customer Name: </th>
                <td>
                    <input type="text" name="ho_ten" id="ho_ten" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Customer date of birth: </th>
                <td>
                    <input type="date" name="ngay_sinh" id="ngay_sinh" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Gender: </th>
                <td>
                    <input type="number" id="gioi_tinh" name="gioi_tinh" min="0" max="1">
                </td>
            </tr>
            <tr>
                <th>Customer identifier: </th>
                <td>
                    <input type="text" name="so_cmnd" id="so_cmnd" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Customer phone number: </th>
                <td>
                    <input type="text" name="so_dien_thoai" id="so_dien_thoai" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Customer email: </th>
                <td>
                    <input type="text" name="email" id="email" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Customer address: </th>
                <td>
                    <input type="text" name="dia_chi" id="dia_chi" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Customer type: </th>
                <td>
                    <select name="customerType">
                        <c:forEach var="customerType" items="${customerTypeList}">
                            <option value="${customerType.getIdCustomerType()}">${customerType.getNameCustomerType()}</option>
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

</body>
</html>
