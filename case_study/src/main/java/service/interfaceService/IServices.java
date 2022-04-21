package service.interfaceService;

import model.customer.Customer;
import model.services.Services;

import java.sql.SQLException;
import java.util.List;

public interface IServices {
    List<Services> selectAllService();
    void insertServices(Services services) throws SQLException;

}
