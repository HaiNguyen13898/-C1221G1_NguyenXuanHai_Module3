package repository.impl.employee;

import model.customer.Customer;
import model.employee.Employee;
import repository.BaseRepository;
import repository.interfaceRepository.employee.IEmployeeRepository;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepositoryImpl implements IEmployeeRepository {

    private static final String INSERT_EMPLOYEE_SQL = "insert into nhan_vien (ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan) values (?,?,?,?,?,?,?,?,?,?)";
    private static final String SELECT_EMPLOYEE_BY_ID = "SELECT * FROM nhan_vien where ma_nhan_vien = ?;";
    private static final String SELECT_All_EMPLOYEE = "SELECT * FROM nhan_vien;";
    private static final String DELETE_EMPLOYEE_SQL = "delete from nhan_vien where ma_nhan_vien = ?;";
    private static final String UPDATE_EMPLOYEE_SQL = "update nhan_vien set ho_ten = ?, ngay_sinh = ?, so_cmnd = ?, luong = ?, so_dien_thoai = ?, email = ?, dia_chi = ?, ma_vi_tri = ?, ma_trinh_do = ?, ma_bo_phan = ? where ma_nhan_vien = ? " ;

    BaseRepository baseRepository = new BaseRepository();


    @Override
    public List<Employee> selectAllEmployee() {
        List<Employee> employeeList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = baseRepository.getConnectionJavaToDB().prepareStatement(SELECT_All_EMPLOYEE);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int idEmployee = rs.getInt("ma_nhan_vien");
                String nameEmployee = rs.getString("ho_ten");
                String dateBirth = rs.getString("ngay_sinh");
                String idCardEmployee = rs.getString("so_cmnd");
                double salary = rs.getDouble("luong");
                String phoneNumber = rs.getString("so_dien_thoai");
                String email = rs.getString("email");
                String address = rs.getString("dia_chi");
                int idPosition = rs.getInt("ma_vi_tri");
                int idEducationDegree = rs.getInt("ma_trinh_do");
                int idDivision = rs.getInt("ma_bo_phan");
                employeeList.add(new Employee(idEmployee, nameEmployee, dateBirth, idCardEmployee, salary, phoneNumber, email, address, idPosition, idEducationDegree, idDivision));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public void insertEmployee(Employee employee) throws SQLException {
        PreparedStatement preparedStatement = baseRepository.getConnectionJavaToDB().prepareStatement(INSERT_EMPLOYEE_SQL);
        preparedStatement.setString(1, employee.getNameEmployee());
        preparedStatement.setString(2, employee.getDateBirth());
        preparedStatement.setString(3, employee.getIdCardEmployee());
        preparedStatement.setDouble(4, employee.getSalary());
        preparedStatement.setString(5, employee.getPhoneNumber());
        preparedStatement.setString(6, employee.getEmail());
        preparedStatement.setString(7, employee.getAddress());
        preparedStatement.setInt(8, employee.getIdPosition());
        preparedStatement.setInt(9, employee.getIdEducationDegree());
        preparedStatement.setInt(10, employee.getIdDivision());
        preparedStatement.executeUpdate();

    }

    @Override
    public void deleteEmployee(int id) throws SQLException {
        String delete = "call delete_nhan_vien(?);";
        CallableStatement callableStatement = baseRepository.getConnectionJavaToDB().prepareCall(delete);
        callableStatement.setInt(1,id);
        callableStatement.executeUpdate();
    }

    @Override
    public void updateEmployee(Employee employee) throws SQLException {
        PreparedStatement preparedStatement = baseRepository.getConnectionJavaToDB().prepareStatement(UPDATE_EMPLOYEE_SQL);
        preparedStatement.setString(1, employee.getNameEmployee());
        preparedStatement.setString(2, employee.getDateBirth());
        preparedStatement.setString(3, employee.getIdCardEmployee());
        preparedStatement.setDouble(4, employee.getSalary());
        preparedStatement.setString(5, employee.getPhoneNumber());
        preparedStatement.setString(6, employee.getEmail());
        preparedStatement.setString(7, employee.getAddress());
        preparedStatement.setInt(8, employee.getIdPosition());
        preparedStatement.setInt(9, employee.getIdEducationDegree());
        preparedStatement.setInt(10, employee.getIdDivision());
        preparedStatement.setInt(11, employee.getIdEmployee());
        preparedStatement.executeUpdate();
    }

    @Override
    public Employee selectEmployee(int id) {
        Employee employee = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnectionJavaToDB().prepareStatement(SELECT_EMPLOYEE_BY_ID);
            preparedStatement.setInt(1, id);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String nameEmployee = rs.getString("ho_ten");
                String dateBirth = rs.getString("ngay_sinh");
                String idCardEmployee = rs.getString("so_cmnd");
                double salary = Double.valueOf(rs.getString("luong"));
                String phoneNumber = rs.getString("so_dien_thoai");
                String email = rs.getString("email");
                String address = rs.getString("dia_chi");
                int idPosition = rs.getInt("ma_vi_tri");
                int idEducationDegree = rs.getInt("ma_trinh_do");
                int idDivision = rs.getInt("ma_bo_phan");
                employee = new Employee (id, nameEmployee, dateBirth, idCardEmployee, salary, phoneNumber, email, address, idPosition, idEducationDegree, idDivision);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employee;
    }

    @Override
    public List<Customer> searchCustomer(String hoTen) {
        return null;
    }
}
