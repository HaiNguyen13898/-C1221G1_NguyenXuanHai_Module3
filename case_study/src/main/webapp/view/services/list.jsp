<%--
  Created by IntelliJ IDEA.
  User: T470s
  Date: 4/21/2022
  Time: 9:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css"/>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<center>
    <h1>Service Furama</h1>
    <h2>
        <a href="/services?action=create">Create Service </a>
    </h2>
</center>

<table class="table" id="tableCustomer" class="table table-striped table-bordered" style="width:100%">
    <thead class="thead-dark">
    <tr>
        <th scope="col">Mã dịch vụ</th>
        <th scope="col">Tên dịch vụ</th>
        <th scope="col">Diện tích</th>
        <th scope="col">Chi phí thuê</th>
        <th scope="col">Số người tối đa</th>
        <th scope="col">Tiêu chuẩn phòng</th>
        <th scope="col">Mô tả tiện nghi khác</th>
        <th scope="col">Diện tích hồ bơi</th>
        <th scope="col">Số tầng</th>
        <th scope="col">Mã kiểu thuê</th>
        <th scope="col">Mã loại dịch vụ</th>
    </tr>
    </thead>
    <c:forEach var="services" items="${servicesList}">
        <tr>
            <td>${services.getIdServices()}</td>
            <td>${services.getNameServices()}</td>
            <td>${services.getAreaServices()}</td>
            <td>${services.getCostServices()}</td>
            <td>${services.getMaxPeopleServices()}</td>
            <td>${services.getStandardRoom()}</td>
            <td>${services.getDescriptionOtherConvenience()}</td>
            <td>${services. getPoolArea()}</td>
            <td>${services. getNumberFloor()}</td>
            <td>${services. getIdRentType()}</td>
            <td>${services. getIdServiceType()}</td>
        </tr>

    </c:forEach>
</table>





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
