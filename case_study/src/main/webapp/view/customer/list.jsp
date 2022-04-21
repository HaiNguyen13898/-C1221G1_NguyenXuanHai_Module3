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

    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css"/>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>

<nav class="row navbar navbar-light bg-light">
    <a class="navbar-brand" href="#">
        <img src="https://wikiland.vn/wp-content/uploads/FuramaPhuQuoc/logo-furama-resort-phu-quoc.png"
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
                    <a class="nav-link" href="#">Employee<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="/customers">Customer<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="/services">Service<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="#">Contract<span class="sr-only">(current)</span></a>
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
            <td>${customer.getMaKhachHang()}</td>
            <td>${customer.getHoTen()}</td>
            <td>${customer.getNgaySinh()}</td>
            <td>
                <c:choose>
                    <c:when test="${customer.getGioiTinh()=='1'}">
                        Nam
                        <br/>
                    </c:when>
                    <c:otherwise>
                        Nữ
                        <br/>
                    </c:otherwise>
                </c:choose>
            </td>
            <td>${customer.getCmnd()}</td>
            <td>${customer.getSoDienThoai()}</td>
            <td>${customer.getEmail()}</td>
            <td>${customer.getDiaChi()}</td>
            <td>
                <c:forEach var="customerType" items="${customerTypeList}">
                    <c:if test="${customer.getMaLoaiKhach()==customerType.getIdCustomerType()}">
                        ${customerType.getNameCustomerType()}
                    </c:if>
                </c:forEach>
            </td>

            <td><a href="/customers?action=edit&id=${customer.getMaKhachHang()}">Sửa</a></td>

            <td>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"
                        onclick="deleteCustomer(${customer.getMaKhachHang()},'${customer.getHoTen()}')">
                    Xoá
                </button>
            </td>

        </tr>

    </c:forEach>
</table>


<form action="/customers?action=delete" method="post">
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Delete Customer</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <input type="hidden" name="id"  id="deleteCustomer">
                    Are you sure about that?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </div>
            </div>
        </div>
    </div>
</form>


<script>
    function deleteCustomer(id) {
        document.getElementById("deleteCustomer").value = id;
    }
</script>

<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

</body>
</html>
