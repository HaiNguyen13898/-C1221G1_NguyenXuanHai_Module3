package service.impl.customer;

import model.customer.CustomerType;
import repository.ICustomerTypeRepository;
import repository.impl.customer.CustomerTypeRepositoryImpl;
import service.ICustomerServiceType;

import java.util.List;

public class CustomerTypeServiceImpl implements ICustomerServiceType {

    ICustomerTypeRepository customerTypeRepository = new CustomerTypeRepositoryImpl();

    @Override
    public List<CustomerType> selectAllCustomerType() {
        return customerTypeRepository.selectAllCustomerType();
    }
}
