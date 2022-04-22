package service.interfaceServices.employee;

import model.customer.Customer;
import model.employee.Employee;

import java.sql.SQLException;
import java.util.List;

public interface IEmployee {
    List<Employee> selectAllEmployee();
    void insertEmployee(Employee employee) throws SQLException;
    void deleteEmployee(int id) throws SQLException;
    void updateEmployee(Employee employee) throws SQLException;
    Employee selectEmployee(int id);
    List<Customer> searchCustomer(String hoTen);
}
