package repository;

import model.customer.Customer;
import model.services.Services;

import java.sql.SQLException;
import java.util.List;

public interface IServicesRepository {

    void insertService(Services services) throws SQLException;

    Services selectService(int id);

    List<Services> selectAllService();

    void deleteService(int id) throws SQLException;

    void updateService(Services services) throws SQLException;
}
