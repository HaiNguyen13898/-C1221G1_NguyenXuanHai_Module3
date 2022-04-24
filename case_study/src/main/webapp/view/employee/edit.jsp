
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer edit information</title>
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
    <h1>Employee Management</h1>
    <h2>
        <a href="/employees">List employee</a>
    </h2>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Edit employee
                </h2>
            </caption>
            <tr>
                <th>Họ tên nhân viên:</th>
                <td>
                    <input type="text" name="ho_ten" size="45"
                           value="<c:out value="${employees.nameEmployee}"/>"/>
                </td>
            </tr>
            <tr>
                <th>Ngày tháng năm sinh:</th>
                <td>
                    <input type="date" name="ngay_sinh" size="45"
                           value="<c:out value="${employees.dateBirth}"/>"/>
                </td>
            </tr>
            <tr>
                <th>số chứng minh nhân dân:</th>
                <td>
                    <input type="text"  name="so_cmnd" size="45"
                           value="<c:out value="${employees.idCardEmployee}"/>">
                </td>
            </tr>
            <tr>
                <th>Lương: </th>
                <td>
                    <input type="text" name="luong" size="45"
                           value="<c:out value="${employees.salary}" /> "/>
                </td>
            </tr>
            <tr>
                <th>Số điện thoại: </th>
                <td>
                    <input type="text" name="so_dien_thoai" size="45"
                           value="<c:out value="${employees.phoneNumber}" />"/>
                </td>
            </tr>
            <tr>
                <th>Email: </th>
                <td>
                    <input type="text" name="email"  size="45"
                           value="<c:out value="${employees.email}"/>"/>
                </td>
            </tr>
            <tr>
                <th>Địa chỉ: </th>
                <td>
                    <input type="text" name="dia_chi" size="45"
                           value="<c:out value="${employees.address}"/>"/>
                </td>
            </tr>
            <tr>
                <th>Mã vị trí: </th>
                <td>
                    <select name="ma_vi_tri">
                        <c:forEach var="employeePosition" items="${positionList}">
                            <option value="${employeePosition.getIdPosition()}">${employeePosition.getNamePosition()}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Mã trình độ: </th>
                <td>
                    <select name="ma_trinh_do">
                        <c:forEach var="employeEducation" items="${educationList}">
                            <option
                                    value="${employeEducation.getIdEducationDegree()}">${employeEducation.getNameEducationDegree()}
                            </option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Mã bộ phận: </th>
                <td>
                    <select name="ma_bo_phan">
                        <c:forEach var="employeeDivision" items="${divisionList}">
                            <option value="${employeeDivision.getIdDivision()}">${employeeDivision.getNameDivision()}</option>
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
