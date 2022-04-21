package repository.interfaceRepository.service;

import model.customer.Customer;
import model.services.Services;

import java.sql.SQLException;
import java.util.List;

public interface IServicesRepository {

    void insertService(Services services) throws SQLException;
    List<Services> selectAllService();

}
