package repository.impl.services;

import model.services.RentType;
import repository.BaseRepository;
import repository.interfaceRepository.service.IRentTypeRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RentTypeRepositoryImpl implements IRentTypeRepository {

    BaseRepository baseRepository = new BaseRepository();

    private static final String SELECT_All_RENT_TYPE = "SELECT * FROM kieu_thue;";

    @Override
    public List<RentType> selectAllRentType() {
        List<RentType> rentTypeList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnectionJavaToDB().prepareStatement(SELECT_All_RENT_TYPE);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int idRentType = rs.getInt("ma_kieu_thue");
                String nameRentType = rs.getString("ten_kieu_thue");
                rentTypeList.add((new RentType(idRentType, nameRentType)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rentTypeList;
    }
}
