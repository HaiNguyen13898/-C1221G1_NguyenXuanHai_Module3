package repository.impl.employee;

import model.employee.EmployeeEducationDegree;
import repository.BaseRepository;
import repository.interfaceRepository.employee.IEducationRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EducationRepositoryImpl implements IEducationRepository {
    BaseRepository baseRepository = new BaseRepository();
    private static final String SELECT_All_EDUCATION = "SELECT * FROM trinh_do;";

    @Override
    public List<EmployeeEducationDegree> selectAllEducation() {
        List<EmployeeEducationDegree> educationList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = baseRepository.getConnectionJavaToDB().prepareStatement(SELECT_All_EDUCATION);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int idEducationDegree = rs.getInt("ma_trinh_do");
                String nameEducationDegree = rs.getString("ten_trinh_do");
                educationList.add(new EmployeeEducationDegree(idEducationDegree,nameEducationDegree));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return educationList;
    }
}
