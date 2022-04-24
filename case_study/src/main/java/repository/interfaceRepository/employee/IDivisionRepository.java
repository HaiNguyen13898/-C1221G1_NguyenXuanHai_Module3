package repository.interfaceRepository.employee;

import model.employee.EmployeeDivision;

import java.util.List;

public interface IDivisionRepository {
    List<EmployeeDivision> selectAllDivision();
}
