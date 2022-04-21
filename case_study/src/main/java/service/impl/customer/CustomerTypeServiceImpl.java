package service.impl.customer;

import model.customer.CustomerType;
import repository.interfaceRepository.customer.ICustomerTypeRepository;
import repository.impl.customer.CustomerTypeRepositoryImpl;
import service.interfaceCustomer.ICustomerServiceType;

import java.util.List;

public class CustomerTypeServiceImpl implements ICustomerServiceType {

    ICustomerTypeRepository customerTypeRepository = new CustomerTypeRepositoryImpl();

    @Override
    public List<CustomerType> selectAllCustomerType() {
        return customerTypeRepository.selectAllCustomerType();
    }
}
