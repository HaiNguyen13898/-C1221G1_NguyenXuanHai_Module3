package repository.interfaceRepository.employee;

import model.employee.EmployeePosition;

import java.util.List;

public interface IPositionRepository {
    List<EmployeePosition> selectAllPosition();
}
