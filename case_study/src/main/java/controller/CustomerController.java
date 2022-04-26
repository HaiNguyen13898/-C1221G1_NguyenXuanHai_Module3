package controller;

import model.customer.Customer;
import model.customer.CustomerType;
import service.interfaceServices.customer.ICustomerService;
import service.interfaceServices.customer.ICustomerServiceType;
import service.impl.customer.CustomerServiceImpl;
import service.impl.customer.CustomerTypeServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@WebServlet(name = "CustomerController", value = "/customers")
public class CustomerController extends HttpServlet {

    private ICustomerService customerService = new CustomerServiceImpl();
    private ICustomerServiceType customerServiceType = new CustomerTypeServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showNewForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            default:
                listCustomer(request, response);
                break;
        }
    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = customerService.selectAllCustomers();
        List<CustomerType> customerTypeList = customerServiceType.selectAllCustomerType();
        request.setAttribute("customerList", customerList);
        request.setAttribute("customerTypeList", customerTypeList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/customer/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerType> customerTypeList = customerServiceType.selectAllCustomerType();
        request.setAttribute("customerTypeList", customerTypeList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/customer/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerType> customerTypeList = customerServiceType.selectAllCustomerType();
        request.setAttribute("customerTypeList", customerTypeList);

        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.selectCustomer(id);
        request.setAttribute("customer", customer);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/customer/edit.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                try {
                    insertCustomer(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "edit":
                updateCustomer(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            case "search" :
                PrintWriter writer = response.getWriter();
                if (true) {
                    search(request,response);
                } else  {
                    writer.println("Not found");
                }

            default:
                break;
        }
    }


    private void insertCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String name = request.getParameter("ho_ten");
        String dateBirth = request.getParameter("ngay_sinh");
        int gender = Integer.parseInt(request.getParameter("gioi_tinh"));
        String idCards = request.getParameter("so_cmnd");
        String phoneNumber = request.getParameter("so_dien_thoai");
        String email = request.getParameter("email");
        String address = request.getParameter("dia_chi");
        int idTypeCustomer = Integer.parseInt(request.getParameter("ma_loai_khach"));
        Customer customer = new Customer(name, dateBirth, gender, idCards, phoneNumber, email, address, idTypeCustomer);
//        try {
//            customerService.insertCustomer(customer);
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }

        Map<String, String> map = customerService.insertCustomer(customer);
        if (map.isEmpty()) {
            listCustomer(request,response);
        } else {
            List<CustomerType> customerTypeList=customerServiceType.selectAllCustomerType();
            request.setAttribute("customerTypeList", customerTypeList);
            request.setAttribute("error", map);
            request.setAttribute("message", "Đã thêm mới thành công");
            listCustomer(request, response);
        }
    }


    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("ho_ten");
        String dateBirth = request.getParameter("ngay_sinh");
        int gender = Integer.parseInt(request.getParameter("gioi_tinh"));
        String idCards = request.getParameter("so_cmnd");
        String phoneNumber = request.getParameter("so_dien_thoai");
        String email = request.getParameter("email");
        String address = request.getParameter("dia_chi");
        int idTypeCustomer = Integer.parseInt(request.getParameter("ma_loai_khach"));
        Customer customer = new Customer(id, name, dateBirth, gender, idCards, phoneNumber, email, address, idTypeCustomer);
        try {
            customerService.updateCustomer(customer);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("message", "Đã sửa thành công");
        listCustomer(request, response);
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            customerService.deleteCustomer(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        List<Customer> customerList = customerService.selectAllCustomers();
        request.setAttribute("customerList", customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void search (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name").toLowerCase();
        String email = request.getParameter("email").toLowerCase();
        int idCustomer = Integer.parseInt(request.getParameter("id"));
        List<Customer> customerList = null;
        try {
            customerList = customerService.searchCustomer(name, email, idCustomer);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("customerList",customerList);
        List<CustomerType> customerTypeList = customerServiceType.selectAllCustomerType();
        request.setAttribute("customerTypeList" , customerTypeList);
        request.getRequestDispatcher("/view/customer/list.jsp").forward(request,response);
    }
}
