package service.impl.Employee;

import model.employee.EmployeePosition;
import repository.impl.employee.PositionRepositoryImpl;
import repository.interfaceRepository.employee.IPositionRepository;
import service.interfaceServices.employee.IEmployeePosition;

import java.util.List;

public class PositionServiceImpl implements IEmployeePosition {
    IPositionRepository positionRepository = new PositionRepositoryImpl();
    @Override
    public List<EmployeePosition> selectAllPosition() {
        return positionRepository.selectAllPosition();
    }
}
