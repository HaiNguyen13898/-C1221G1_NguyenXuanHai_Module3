package service.impl.Employee;

import model.customer.Customer;
import model.employee.Employee;
import repository.impl.employee.EmployeeRepository;
import repository.interfaceRepository.employee.IEmployeeRepository;
import service.interfaceServices.employee.IEmployee;

import java.sql.SQLException;
import java.util.List;

public class EmployeeServiceImpl implements IEmployee {

    IEmployeeRepository employeeRepository = new EmployeeRepository();
    @Override
    public List<Employee> selectAllEmployee() {
        return employeeRepository.selectAllEmployee();
    }

    @Override
    public void insertEmployee(Employee employee) throws SQLException {
        employeeRepository.insertEmployee(employee);
    }

    @Override
    public void deleteEmployee(int id) throws SQLException {

    }

    @Override
    public void updateEmployee(Employee employee) throws SQLException {
        employeeRepository.updateEmployee(employee);
    }

    @Override
    public Employee selectEmployee(int id) {
        return null;
    }



    @Override
    public List<Customer> searchCustomer(String hoTen) {
        return null;
    }
}
