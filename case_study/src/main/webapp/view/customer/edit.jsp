<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: T470s
  Date: 4/20/2022
  Time: 10:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer edit information</title>
</head>
<body>
<center>
    <h1>Customer Management</h1>
    <h2>
        <a href="/customers">List customers</a>
    </h2>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Edit customer
                </h2>
            </caption>
<%--            <c:if test="${customer != null}">--%>
<%--                <input type="hidden" name="id" value="<c:out value='${customer.getMaKhachHang()}' />"/>--%>
<%--            </c:if>--%>
            <tr>
                <th>Customer Name:</th>
                <td>
                    <input type="text" name="ho_ten" id="ho_ten" size="45"
                           value="<c:out value="${customer.getHoTen()}"/>"/>
                </td>
            </tr>
            <tr>
                <th>Customer date of birth:</th>
                <td>
                    <input type="date" name="ngay_sinh" id="ngay_sinh" size="45"
                           value="<c:out value="${customer.getNgaySinh()}"/>"/>
                </td>
            </tr>
            <tr>
                <th>Gender:</th>
                <td>
                    <input type="number" id="gioi_tinh" name="gioi_tinh" min="0" max="1"
                           value="<c:out value="${customer.getGioiTinh()}"/>">
                </td>
            </tr>
            <tr>
                <th>Customer identifier:</th>
                <td>
                    <input type="text" name="so_cmnd" id="so_cmnd" size="45"
                           value="<c:out value="${customer.getCmnd()}" /> "/>
                </td>
            </tr>
            <tr>
                <th>Customer phone number:</th>
                <td>
                    <input type="text" name="so_dien_thoai" id="so_dien_thoai" size="45"
                           value="<c:out value="${customer.getSoDienThoai()}" />"/>
                </td>
            </tr>
            <tr>
                <th>Customer email:</th>
                <td>
                    <input type="text" name="email" id="email" size="45"
                           value="<c:out value="${customer.getEmail()}"/>"/>
                </td>
            </tr>
            <tr>
                <th>Customer address:</th>
                <td>
                    <input type="text" name="dia_chi" id="dia_chi" size="45"
                           value="<c:out value="${customer.getDiaChi()}"/>"/>
                </td>
            </tr>
            <tr>
                <th>Customer type: </th>
                <td>
                    <select name="ma_loai_khach" value="<c:out value="${customer.getMaLoaiKhach()}"/>">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>

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
