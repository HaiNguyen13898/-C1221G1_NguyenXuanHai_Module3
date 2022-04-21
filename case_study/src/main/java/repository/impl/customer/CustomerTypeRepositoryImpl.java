package repository.impl.customer;

import model.customer.CustomerType;
import repository.BaseRepository;
import repository.ICustomerTypeRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeRepositoryImpl implements ICustomerTypeRepository {
    private static String SELECT_ALL_CUSTOMER_TYPE = "select * from loai_khach";
    BaseRepository baseRepository = new BaseRepository();
    ResultSet resultSet = null;

    @Override
    public List<CustomerType> selectAllCustomerType() {
        List<CustomerType> customerTypeList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnectionJavaToDB().prepareStatement(SELECT_ALL_CUSTOMER_TYPE);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int idCustomerType = resultSet.getInt("ma_loai_khach");
                String nameCustomerType = resultSet.getString("ten_loai_khach");
                customerTypeList.add(new CustomerType(idCustomerType, nameCustomerType));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerTypeList;
    }
}
