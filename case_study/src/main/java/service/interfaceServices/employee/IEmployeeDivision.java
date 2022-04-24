package service.interfaceServices.employee;

import model.employee.Employee;
import model.employee.EmployeeDivision;

import java.util.List;

public interface IEmployeeDivision {
    List<EmployeeDivision> selectAllDivision();
}
