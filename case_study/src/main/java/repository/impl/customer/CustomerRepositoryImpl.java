package repository.impl.customer;

import model.customer.Customer;
import repository.BaseRepository;
import repository.ICustomerRepository;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements ICustomerRepository {
    private static final String INSERT_CUSTOMER_SQL = "insert into khach_hang ( ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi, ma_loai_khach) values (?,?,?,?,?,?,?,?);";
    private static final String SELECT_CUSTOMER_BY_ID = "select * from khach_hang where ma_khach_hang = ?";
    private static final String SELECT_All_CUSTOMER = "select * from khach_hang order by ho_ten";
//    private static final String DELETE_CUSTOMER_SQL = "delete from khach_hang where ma_khach_hang = ?;";
    private static final String UPDATE_CUSTOMER_SQL = "update khach_hang set ho_ten = ?, ngay_sinh = ?, gioi_tinh = ?, so_cmnd = ?, so_dien_thoai = ?, email = ?, dia_chi = ?, ma_loai_khach = ? where ma_khach_hang = ?";


    BaseRepository baseRepository = new BaseRepository();

    @Override
    public void insertCustomer(Customer customer) throws SQLException {
        PreparedStatement preparedStatement = baseRepository.getConnectionJavaToDB().prepareStatement(INSERT_CUSTOMER_SQL);
        preparedStatement.setString(1, customer.getHoTen());
        preparedStatement.setString(2, customer.getNgaySinh());
        preparedStatement.setInt(3, customer.getGioiTinh());
        preparedStatement.setString(4, customer.getCmnd());
        preparedStatement.setString(5, customer.getSoDienThoai());
        preparedStatement.setString(6, customer.getEmail());
        preparedStatement.setString(7, customer.getDiaChi());
        preparedStatement.setInt(8, customer.getMaLoaiKhach());
        preparedStatement.executeUpdate();
    }

    @Override
    public Customer selectCustomer(int id) {
        Customer customer = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnectionJavaToDB().prepareStatement(SELECT_CUSTOMER_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String hoTen = rs.getString("ho_ten");
                String ngaySinh = rs.getString("ngay_sinh");
                int gioiTinh = rs.getInt("gioi_tinh");
                String cmnd = rs.getString("so_cmnd");
                String dienThoai = rs.getString("so_dien_thoai");
                String email = rs.getString("email");
                String diaChi = rs.getString("dia_chi");
                int maLoaiKhach = rs.getInt("ma_loai_khach");
                customer = new Customer(id, hoTen, ngaySinh, gioiTinh, cmnd, dienThoai, email, diaChi, maLoaiKhach);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return customer;
    }

    @Override
    public List<Customer> selectAllCustomers() {
        List<Customer> customerList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnectionJavaToDB().prepareStatement(SELECT_All_CUSTOMER);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int maKhachHang = rs.getInt("ma_khach_hang");
                String hoTen = rs.getString("ho_ten");
                String ngaySinh = rs.getString("ngay_sinh");
                int gioiTinh = rs.getInt("gioi_tinh");
                String cmnd = rs.getString("so_cmnd");
                String dienThoai = rs.getString("so_dien_thoai");
                String email = rs.getString("email");
                String diaChi = rs.getString("dia_chi");
                int maLoaiKhach = rs.getInt("ma_loai_khach");
                customerList.add(new Customer(maKhachHang, hoTen, ngaySinh, gioiTinh, cmnd, dienThoai, email, diaChi, maLoaiKhach));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    @Override
    public void deleteCustomer(int id) throws SQLException {
        String delete = "call delete_khach_hang(?)";
        CallableStatement  callableStatement = baseRepository.getConnectionJavaToDB().prepareCall(delete);
        callableStatement.setInt(1, id);
        callableStatement.executeUpdate();

    }

    @Override
    public void updateCustomer(Customer customer) throws SQLException {
//        boolean rowUpdate;
        PreparedStatement preparedStatement = baseRepository.getConnectionJavaToDB().prepareStatement(UPDATE_CUSTOMER_SQL);
        preparedStatement.setString(1, customer.getHoTen());
        preparedStatement.setString(2, customer.getNgaySinh());
        preparedStatement.setInt(3, customer.getGioiTinh());
        preparedStatement.setString(4, customer.getCmnd());
        preparedStatement.setString(5, customer.getSoDienThoai());
        preparedStatement.setString(6, customer.getEmail());
        preparedStatement.setString(7, customer.getDiaChi());
        preparedStatement.setInt(8, customer.getMaLoaiKhach());
        preparedStatement.setInt(9, customer.getMaKhachHang());

         preparedStatement.executeUpdate();
//        return rowUpdate;
    }

    @Override
    public List<Customer> searchCustomer(String country) {
        return null;
    }
}
