package repository.impl.employee;

import model.employee.EmployeeDivision;
import repository.BaseRepository;
import repository.interfaceRepository.employee.IDivisionRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DivisionRepositoryImpl implements IDivisionRepository {
    BaseRepository baseRepository = new BaseRepository();
    private static final String SELECT_All_DIVISION = "SELECT * FROM bo_phan;";
    @Override
    public List<EmployeeDivision> selectAllDivision() {
        List<EmployeeDivision> divisionList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = baseRepository.getConnectionJavaToDB().prepareStatement(SELECT_All_DIVISION);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                 int idDivision = rs.getInt("ma_bo_phan");
                 String nameDivision = rs.getString("ten_bo_phan");
                 divisionList.add(new EmployeeDivision(idDivision, nameDivision));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return divisionList;
    }
}
