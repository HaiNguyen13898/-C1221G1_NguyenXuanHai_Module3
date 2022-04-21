package service.services;

import model.customer.Customer;
import model.services.Services;
import repository.IServicesRepository;
import repository.impl.services.ServiceRepositoryImpl;
import service.IServices;

import java.sql.SQLException;
import java.util.List;

public class ServicesImpl implements IServices {

    IServicesRepository servicesRepository = new ServiceRepositoryImpl();
    @Override
    public List<Services> selectAllService() {
        return servicesRepository.selectAllService();
    }

    @Override
    public void insertServices(Services services) throws SQLException {
        servicesRepository.insertService(services);
    }

    @Override
    public void deleteServices(int id) throws SQLException {

    }

    @Override
    public void updateServices(Customer customer) throws SQLException {

    }

    @Override
    public Services selectServices(int id) {
        return null;
    }
}
