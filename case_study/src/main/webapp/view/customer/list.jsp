<%--
  Created by IntelliJ IDEA.
  User: T470s
  Date: 4/20/2022
  Time: 8:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer List</title>
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css" />
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<center>
    <h1>CUSTOMER</h1>
    <h2>
        <a href="/customers?action=create">Create customer </a>
    </h2>
</center>

<table class="table" id="tableCustomer" class="table table-striped table-bordered" style="width:100%">
    <thead class="thead-dark">
    <tr>
        <th scope="col">Mã khách hàng</th>
        <th scope="col">Họ tên</th>
        <th scope="col">Ngày sinh</th>
        <th scope="col">Giới tính</th>
        <th scope="col">Số CMND</th>
        <th scope="col">Số điện thoại</th>
        <th scope="col">Email</th>
        <th scope="col">Địa chỉ</th>
        <th scope="col">Mã loại khách</th>
        <th scope="col">Sửa</th>
        <th scope="col">Xoá</th>
    </tr>
    </thead>
    <c:forEach var="customer" items="${customerList}">
        <tr>
            <td><c:out value="${customer.getMaKhachHang()}"/></td>
            <td><c:out value="${customer.getHoTen()}"/></td>
            <td><c:out value="${customer.getNgaySinh()}"/></td>
            <td>
                <c:choose>
                    <c:when test="${customer.getGioiTinh()=='1'}">
                        Nam
                        <br />
                    </c:when>
                    <c:otherwise>
                        Nữ
                        <br />
                    </c:otherwise>
                </c:choose>
            </td>
            <td><c:out value="${customer.getCmnd()}"/></td>
            <td><c:out value="${customer.getSoDienThoai()}"/></td>
            <td><c:out value="${customer.getEmail()}"/></td>
            <td><c:out value="${customer.getDiaChi()}"/></td>
            <td><c:out value="${customer.getMaLoaiKhach()}"/></td>
            <td><a href="/customers?action=edit&id=${customer.getMaKhachHang()}">Sửa</a></td>
            <td><a href="/customers?action=delete&id=${customer.getMaKhachHang()}">Xoá</a></td>
        </tr>

    </c:forEach>
</table>




<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function() {
        $('#tableCustomer').dataTable( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        } );
    } );
</script>
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

</body>
</html>
