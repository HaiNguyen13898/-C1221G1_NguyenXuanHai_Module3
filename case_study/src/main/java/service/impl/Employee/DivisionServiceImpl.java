package service.impl.Employee;

import model.employee.EmployeeDivision;
import repository.impl.employee.DivisionRepositoryImpl;
import repository.interfaceRepository.employee.IDivisionRepository;
import service.interfaceServices.employee.IEmployeeDivision;

import java.util.List;

public class DivisionServiceImpl implements IEmployeeDivision {
    IDivisionRepository divisionRepository = new DivisionRepositoryImpl();
    @Override
    public List<EmployeeDivision> selectAllDivision() {
        return divisionRepository.selectAllDivision();
    }
}
