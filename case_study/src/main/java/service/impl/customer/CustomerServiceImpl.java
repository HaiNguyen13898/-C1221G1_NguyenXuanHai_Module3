package service.impl.customer;

import model.customer.Customer;
import repository.interfaceRepository.customer.ICustomerRepository;
import repository.impl.customer.CustomerRepositoryImpl;
import service.interfaceServices.customer.ICustomerService;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerServiceImpl implements ICustomerService {

    ICustomerRepository customerRepository = new CustomerRepositoryImpl();

    //    @Override
//    public void insertCustomer(Customer customer) throws SQLException {
//        customerRepository.insertCustomer(customer);
//    }
    @Override
    public Map<String, String> insertCustomer(Customer customer) throws SQLException {

        Map<String, String>map = new HashMap<>();
        if (customer.getHoTen().equals("")){
            map.put("name","Không để trống");
        } else if (!customer.getHoTen().matches("^\\p{L}+[0-9]*( (\\p{L}|[0-9])+)*$")){
            map.put("name","tên không hợp lệ");
        }

        if (!customer.getCmnd().matches("^([0-9]{9})|([0-9]{12})$")){
            map.put("soCMND","Số CMND phải đúng định dạng XXXXXXXXX hoặc XXXXXXXXXXXX (X là số 0-9)");
        }

        if (!customer.getSoDienThoai().matches("^([0][9][0][0-9]{7})|([0][9][1][0-9]{7})$")){
            map.put("soDT","Số điện thoại phải đúng định dạng 090xxxxxxx hoặc 091xxxxxxx");
        }

        if (!customer.getEmail().matches("([a-z]\\w+@[a-z]{2,}\\.)\\w{2,10}(\\.\\w{2,3})?")){
            map.put("email","Địa chỉ email phải đúng định dạng email");

        }
        if (map.isEmpty()){
            customerRepository.insertCustomer(customer);
        }
        return map;
    }

    @Override
    public Customer selectCustomer(int id) {
        return customerRepository.selectCustomer(id);
    }

    @Override
    public List<Customer> searchCustomer(String name, String email, int idCustomer) throws SQLException {
        return customerRepository.searchCustomer(name, email, idCustomer);
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

}
