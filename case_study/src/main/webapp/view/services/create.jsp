<%--
  Created by IntelliJ IDEA.
  User: T470s
  Date: 4/21/2022
  Time: 2:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<%-- ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang, ma_kieu_thue, ma_loai_dich_vu--%>
<%--int idServices, String nameServices, int areaServices, double costServices, int maxPeopleServices, String standardRoom, String descriptionOtherConvenience, double poolArea, int numberFloor, int idRentType, int idServiceType--%>

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
    <h1>Services management</h1>
    <a href="/services">Back to service list</a>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>Create service</h2>
            </caption>
            <tr>
                <th>Tên dịch vụ: </th>
                <td>
                    <input type="text" name="ten_dich_vu" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Diện tích: </th>
                <td>
                    <input type="text" name="dien_tich" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Chi phí thuê: </th>
                <td>
                    <input type="text" name="chi_phi_thue" size="45">
                </td>
            </tr>
            <tr>
                <th>Số người tối đa: </th>
                <td>
                    <input type="text" name="so_nguoi_toi_da"  size="45"/>
                </td>
            </tr>
            <tr>
                <th>Tiêu chuẩn phòng: </th>
                <td>
                    <input type="text" name="tieu_chuan_phong"  size="45"/>
                </td>
            </tr>
            <tr>
                <th>Mô tả tiện nghi khác: </th>
                <td>
                    <input type="text" name="mo_ta_tien_nghi_khac"  size="45"/>
                </td>
            </tr>
            <tr>
                <th>Diện tích hồ bơi: </th>
                <td>
                    <input type="text" name="dien_tich_ho_boi" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Số tầng: </th>
                <td>
                    <input type="text" name="so_tang" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Mã kiểu thuê: </th>
                <td>
                    <input type="text" name="ma_kieu_thue" size="45"/>
                </td>
            </tr>
            <tr>
            <tr>
                <th>Mã loại dịch vụ: </th>
                <td>
                    <input type="text" name="ma_loai_dich_vu" size="45"/>
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
