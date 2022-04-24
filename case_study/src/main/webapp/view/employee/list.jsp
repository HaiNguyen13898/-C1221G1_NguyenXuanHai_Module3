<%--
  Created by IntelliJ IDEA.
  User: T470s
  Date: 4/22/2022
  Time: 10:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee</title>
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
    <h1>Employee</h1>
    <h2>
        <a href="/employees?action=create">Create employees </a>
    </h2>
    <p>${message}</p>
</center>

<table class="table" id="tableCustomer" class="table table-striped table-bordered" style="width:100%">
    <thead class="thead-dark">
    <tr>
        <th scope="col">Mã nhân viên</th>
        <th scope="col">Họ tên</th>
        <th scope="col">Ngày sinh</th>
        <th scope="col">Số CMND</th>
        <th scope="col">Lương</th>
        <th scope="col">Số điện thoại</th>
        <th scope="col">Email</th>
        <th scope="col">Địa chỉ</th>
        <th scope="col">Mã vị trí</th>
        <th scope="col">Mã trình độ</th>
        <th scope="col">Mã bộ phận</th>
        <th scope="col">Sửa</th>
        <th scope="col">Xoá</th>
    </tr>
    </thead>
    <c:forEach var="employee" items="${employeeList}">
        <tr>
            <td>${employee.getIdEmployee()}</td>
            <td>${employee.getNameEmployee()}</td>
            <td>${employee.getDateBirth()}</td>
            <td>${employee.getIdCardEmployee()}</td>
            <td>${employee.getSalary()}</td>
            <td>${employee.getPhoneNumber()}</td>
            <td>${employee.getEmail()}</td>
            <td>${employee.getAddress()}</td>

            <td>
                <c:forEach var="employeePosition" items="${positionList}">
                    <c:if test="${employee.getIdPosition() == employeePosition.getIdPosition()}">
                        ${employeePosition.getNamePosition()}
                    </c:if>
                </c:forEach>
            </td>

            <td>
                <c:forEach var="employeeEducation" items="${educationList}">
                    <c:if test="${employee.getIdEducationDegree() == employeeEducation.getIdEducationDegree()}">
                        ${employeeEducation.getNameEducationDegree()}
                    </c:if>
                </c:forEach>
            </td>

            <td>
                <c:forEach var="employeeDivison" items="${divisionList}">
                    <c:if test="${employee.getIdDivision() == employeeDivison.getIdDivision()}">
                        ${employeeDivison.getNameDivision()}
                    </c:if>
                </c:forEach>
            </td>

            <td><a href="/employees?action=edit&id=${employee.getIdEmployee()}">Sửa</a></td>
            <td>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"
                        onclick="deleteEmployee(${employee.getIdEmployee()},'${employee.getNameEmployee()}')">
                    Xoá
                </button>
            </td>
        </tr>

    </c:forEach>
</table>


<form action="/employees?action=delete" method="post">
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Delete Employee</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="id" id="deleteEmployee">
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
    function deleteEmployee(id) {
        document.getElementById("deleteEmployee").value = id;
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
