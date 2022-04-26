package service.interfaceServices.customer;

import model.customer.Customer;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ICustomerService {

    List<Customer> selectAllCustomers();

    //    void insertCustomer(Customer customer) throws SQLException;
    Map<String, String> insertCustomer(Customer customer) throws SQLException;

    void deleteCustomer(int id) throws SQLException;

    void updateCustomer(Customer customer) throws SQLException;

    Customer selectCustomer(int id);

    List<Customer> searchCustomer(String name, String email, int idCustomer) throws SQLException;

}
