package service.impl.customer;

import model.customer.Customer;
import repository.interfaceRepository.customer.ICustomerRepository;
import repository.impl.customer.CustomerRepositoryImpl;
import service.interfaceCustomer.ICustomerService;

import java.sql.SQLException;
import java.util.List;

public class CustomerServiceImpl implements ICustomerService {

    ICustomerRepository customerRepository = new CustomerRepositoryImpl();

    @Override
    public void insertCustomer(Customer customer) throws SQLException {
        customerRepository.insertCustomer(customer);
    }

    @Override
    public Customer selectCustomer(int id) {
        return customerRepository.selectCustomer(id);
    }

    @Override
    public List<Customer> selectAllCustomers() {
        return customerRepository.selectAllCustomers();
    }

    @Override
    public void deleteCustomer(int id) throws SQLException {
        customerRepository.deleteCustomer(id);
    }

    @Override
    public void updateCustomer(Customer customer) throws SQLException {
        customerRepository.updateCustomer(customer);
    }

    @Override
    public List<Customer> searchCustomer(String hoTen) {
        return null;
    }
}
