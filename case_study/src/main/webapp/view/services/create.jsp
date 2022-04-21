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
</head>
<body>

<%-- ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang, ma_kieu_thue, ma_loai_dich_vu--%>
<%--int idServices, String nameServices, int areaServices, double costServices, int maxPeopleServices, String standardRoom, String descriptionOtherConvenience, double poolArea, int numberFloor, int idRentType, int idServiceType--%>
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

</body>

</html>
