package service.interfaceServices.employee;

import model.employee.EmployeeDivision;
import model.employee.EmployeePosition;

import java.util.List;

public interface IEmployeePosition {
    List<EmployeePosition> selectAllPosition();
}
