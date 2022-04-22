package controller;

import model.customer.Customer;
import model.customer.CustomerType;
import model.employee.Employee;
import service.impl.Employee.EmployeeServiceImpl;
import service.interfaceServices.employee.IEmployee;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "EmployeeController", value = "/employees")
public class EmployeeController extends HttpServlet {


    private IEmployee employeeService = new EmployeeServiceImpl();

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
            case "delete":
                break;
            default:
                listEmployee(request, response);
                break;
        }
    }

    private void listEmployee(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList = employeeService.selectAllEmployee();
        request.setAttribute("employeeList", employeeList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/employee/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList = employeeService.selectAllEmployee();
        request.setAttribute("employeeList", employeeList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/employee/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employees = employeeService.selectEmployee(id);
        request.setAttribute("employees", employees);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/employee/edit.jsp");
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
                insertEmployee(request, response);
                break;
            case "edit":
                updateEmployee(request, response);
                break;
            case "delete":
                break;
            default:
                break;
        }
    }

    private void insertEmployee(HttpServletRequest request, HttpServletResponse response) {
        String nameEmployee = request.getParameter("ho_ten");
        String dateBirth = request.getParameter("ngay_sinh");
        String idCardEmployee = request.getParameter("so_cmnd");
        double salary = Double.parseDouble(request.getParameter("luong"));
        String phoneNumber = request.getParameter("so_dien_thoai");
        String email = request.getParameter("email");
        String address = request.getParameter("dia_chi");
        int idPosition = Integer.parseInt(request.getParameter("ma_vi_tri"));
        int idEducationDegree = Integer.parseInt(request.getParameter("ma_trinh_do"));
        int idDivision = Integer.parseInt(request.getParameter("ma_bo_phan"));
        Employee employee = new Employee(nameEmployee, dateBirth, idCardEmployee, salary, phoneNumber, email, address, idPosition, idEducationDegree, idDivision);
        try {
            employeeService.insertEmployee(employee);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("message", "Đã thêm mới thành công");
        listEmployee(request, response);
    }

    private void updateEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String nameEmployee = request.getParameter("ho_ten");
        String dateBirth = request.getParameter("ngay_sinh");
        String idCardEmployee = request.getParameter("so_cmnd");
        double salary = Double.parseDouble(request.getParameter("luong"));
        String phoneNumber = request.getParameter("so_dien_thoai");
        String email = request.getParameter("email");
        String address = request.getParameter("dia_chi");
        int idPosition = Integer.parseInt(request.getParameter("ma_vi_tri"));
        int idEducationDegree = Integer.parseInt(request.getParameter("ma_trinh_do"));
        int idDivision = Integer.parseInt(request.getParameter("ma_bo_phan"));
        Employee employee = new Employee(id, nameEmployee, dateBirth, idCardEmployee, salary, phoneNumber, email, address, idPosition, idEducationDegree, idDivision);
        try {
            employeeService.updateEmployee(employee);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("message", "Đã sửa thành công");
        listEmployee(request, response);

    }
}
