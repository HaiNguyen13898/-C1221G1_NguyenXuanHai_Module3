package repository.interfaceRepository.customer;

import model.customer.CustomerType;

import java.util.List;

public interface ICustomerTypeRepository {
    List<CustomerType> selectAllCustomerType ();
}
