package service.impl.Employee;

import model.employee.EmployeeEducationDegree;
import repository.impl.employee.EducationRepositoryImpl;
import repository.interfaceRepository.employee.IEducationRepository;
import service.interfaceServices.employee.IEmployeeEducation;

import java.util.List;

public class EducationServiceImpl implements IEmployeeEducation {
    IEducationRepository educationRepository = new EducationRepositoryImpl();
    @Override
    public List<EmployeeEducationDegree> selectAllEducation() {
        return educationRepository.selectAllEducation();
    }
}
