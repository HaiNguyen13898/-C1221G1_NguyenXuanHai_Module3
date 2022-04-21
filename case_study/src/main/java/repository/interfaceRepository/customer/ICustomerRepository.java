package repository.interfaceRepository.customer;

import model.customer.Customer;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerRepository {

    void insertCustomer(Customer customer) throws SQLException;

    Customer selectCustomer(int id);

    List<Customer> selectAllCustomers();

    void deleteCustomer(int id) throws SQLException;

    void updateCustomer(Customer customer) throws SQLException;

    List<Customer> searchCustomer(String hoTen);

}
