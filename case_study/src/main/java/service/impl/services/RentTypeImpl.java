package service.impl.services;

import model.services.RentType;
import repository.impl.services.RentTypeRepositoryImpl;
import repository.interfaceRepository.service.IRentTypeRepository;
import service.interfaceServices.service.IRentType;

import java.util.List;

public class RentTypeImpl implements IRentType {
    IRentTypeRepository rentTypeRepository = new RentTypeRepositoryImpl();
    @Override
    public List<RentType> selectAllRentType() {
        return rentTypeRepository.selectAllRentType();
    }
}
