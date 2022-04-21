package service.impl.services;

import model.services.ServiceType;
import repository.impl.services.ServiceTypeRepositoryImpl;
import repository.interfaceRepository.service.IServiceTypeRepository;
import service.interfaceService.IServiceType;

import java.util.List;

public class ServiceTypeImpl implements IServiceType {
    IServiceTypeRepository serviceTypeRepository = new ServiceTypeRepositoryImpl();
    @Override
    public List<ServiceType> selectAllServiceType() {
        return serviceTypeRepository.selectAllServiceType();
    }
}
