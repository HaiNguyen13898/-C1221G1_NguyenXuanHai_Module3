package service.impl.Employee;

import model.customer.Customer;
import model.employee.Employee;
import repository.impl.employee.EmployeeRepositoryImpl;
import repository.interfaceRepository.employee.IEmployeeRepository;
import service.interfaceServices.employee.IEmployee;

import java.sql.SQLException;
import java.util.List;

public class EmployeeServiceImpl implements IEmployee {

    IEmployeeRepository employeeRepository = new EmployeeRepositoryImpl();
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
        employeeRepository.deleteEmployee(id);
    }

    @Override
    public void updateEmployee(Employee employee) throws SQLException {
        employeeRepository.updateEmployee(employee);
    }

    @Override
    public Employee selectEmployee(int id) {
        return employeeRepository.selectEmployee(id);
    }

    @Override
    public List<Customer> searchCustomer(String hoTen) {
        return null;
    }
}
