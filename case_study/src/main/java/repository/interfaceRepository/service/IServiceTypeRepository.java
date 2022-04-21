package repository.interfaceRepository.service;

import model.services.ServiceType;

import java.util.List;

public interface IServiceTypeRepository {
    List<ServiceType> selectAllServiceType ();

}
