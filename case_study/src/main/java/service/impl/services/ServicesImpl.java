package service.impl.services;

import model.services.Services;
import repository.interfaceRepository.service.IServicesRepository;
import repository.impl.services.ServiceRepositoryImpl;
import service.interfaceService.IServices;

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

}
