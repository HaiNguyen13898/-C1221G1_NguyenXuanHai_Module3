package repository.impl.employee;

import model.employee.EmployeePosition;
import repository.BaseRepository;
import repository.interfaceRepository.employee.IPositionRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PositionRepositoryImpl implements IPositionRepository {
    BaseRepository baseRepository = new BaseRepository();
    private static final String SELECT_All_POSITION = "SELECT * FROM vi_tri;";

    @Override
    public List<EmployeePosition> selectAllPosition() {
        List<EmployeePosition> positionList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = baseRepository.getConnectionJavaToDB().prepareStatement(SELECT_All_POSITION);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int idPosition = rs.getInt("ma_vi_tri");
                String namePosition = rs.getString("ten_vi_tri");
                positionList.add(new EmployeePosition(idPosition, namePosition));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return positionList;
    }
}
