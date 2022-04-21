package repository.interfaceRepository.service;

import model.services.RentType;

import java.util.List;

public interface IRentTypeRepository {
    List<RentType> selectAllRentType ();
}
