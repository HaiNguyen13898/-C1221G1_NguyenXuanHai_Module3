package service.interfaceServices.employee;

import model.employee.EmployeeDivision;
import model.employee.EmployeeEducationDegree;

import java.util.List;

public interface IEmployeeEducation {
    List<EmployeeEducationDegree> selectAllEducation();
}
