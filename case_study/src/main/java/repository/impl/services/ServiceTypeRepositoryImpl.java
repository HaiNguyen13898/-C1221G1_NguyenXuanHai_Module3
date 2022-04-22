package repository.impl.services;

import model.services.ServiceType;
import repository.BaseRepository;
import repository.interfaceRepository.service.IServiceTypeRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceTypeRepositoryImpl implements IServiceTypeRepository {
    private static final String SELECT_All_SERVICE_TYPE = "SELECT * FROM loai_dich_vu;";
    BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<ServiceType> selectAllServiceType() {
        List<ServiceType> serviceTypeList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnectionJavaToDB().prepareStatement(SELECT_All_SERVICE_TYPE);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int idServiceType = rs.getInt("ma_loai_dich_vu");
                String nameServiceType = rs.getString("ten_loai_dich_vu");
                serviceTypeList.add(new ServiceType(idServiceType,nameServiceType));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return serviceTypeList;
    }
}
