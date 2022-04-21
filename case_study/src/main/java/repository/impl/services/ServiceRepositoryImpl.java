package repository.impl.services;

import model.services.Services;
import repository.BaseRepository;
import repository.interfaceRepository.service.IServicesRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceRepositoryImpl implements IServicesRepository {


    private static final String SELECT_All_SERVICES = "select * from dich_vu;";
    private static final String INSERT_SERVICES_SQL = "INSERT INTO dich_vu ( ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang, ma_kieu_thue, ma_loai_dich_vu) VALUES (?,?,?,?,?,?,?,?,?,?)";

    BaseRepository baseRepository = new BaseRepository();

    @Override
    public void insertService(Services services) throws SQLException {
        PreparedStatement preparedStatement = baseRepository.getConnectionJavaToDB().prepareStatement(INSERT_SERVICES_SQL);
        preparedStatement.setString(1, services.getNameServices());
        preparedStatement.setInt(2, services.getAreaServices());
        preparedStatement.setDouble(3, services.getCostServices());
        preparedStatement.setInt(4, services.getMaxPeopleServices());
        preparedStatement.setString(5, services.getStandardRoom());
        preparedStatement.setString(6, services.getDescriptionOtherConvenience());
        preparedStatement.setDouble(7, services.getPoolArea());
        preparedStatement.setInt(8, services.getNumberFloor());
        preparedStatement.setInt(9, services.getIdRentType());
        preparedStatement.setInt(10, services.getIdServiceType());
        preparedStatement.executeUpdate();
    }

    @Override
    public List<Services> selectAllService() {
        List<Services> servicesList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnectionJavaToDB().prepareStatement(SELECT_All_SERVICES);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int idServices = rs.getInt("ma_dich_vu");
                String nameServices = rs.getString("ten_dich_vu");
                int areaServices = rs.getInt("dien_tich");
                double costServices = rs.getInt("chi_phi_thue");
                int maxPeopleServices = rs.getInt("so_nguoi_toi_da");
                String standardRoom = rs.getString("tieu_chuan_phong");
                String descriptionOtherConvenience = rs.getString("mo_ta_tien_nghi_khac");
                double poolArea = rs.getInt("dien_tich_ho_boi");
                int numberFloor = rs.getInt("so_tang");
                int idRentType = rs.getInt("ma_kieu_thue");
                int idServiceType = rs.getInt("ma_loai_dich_vu");
                servicesList.add(new Services(idServices, nameServices, areaServices, costServices, maxPeopleServices, standardRoom, descriptionOtherConvenience, poolArea, numberFloor, idRentType, idServiceType));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return servicesList;
    }

}
