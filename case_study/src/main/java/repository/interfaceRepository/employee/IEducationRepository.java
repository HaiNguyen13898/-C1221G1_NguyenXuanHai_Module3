package repository.interfaceRepository.employee;

import model.employee.EmployeeEducationDegree;

import java.util.List;

public interface IEducationRepository {
    List<EmployeeEducationDegree> selectAllEducation();
}
