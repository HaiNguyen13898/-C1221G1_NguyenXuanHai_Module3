package controller;

import model.customer.Customer;
import model.services.Services;
import service.IServices;
import service.services.ServicesImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ServiceController", value = "/services")
public class ServiceController extends HttpServlet {

    IServices services = new ServicesImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showNewForm(request,response);
                break;
            case "edit":
                break;
            case "delete":
                break;
            default:
                listServices(request, response);
                break;
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
                insertServices(request, response);
                break;
            case "edit":
                break;
            case "delete":
                break;

        }
    }


    private void listServices(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Services> servicesList = services.selectAllService();
        request.setAttribute("servicesList", servicesList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/services/list.jsp");
        requestDispatcher.forward(request, response);
    }


    //    ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang, ma_kieu_thue, ma_loai_dich_vu
//    int idServices, String nameServices, int areaServices, double costServices, int maxPeopleServices, String standardRoom, String descriptionOtherConvenience, double poolArea, int numberFloor, int idRentType, int idServiceType
    private void insertServices(HttpServletRequest request, HttpServletResponse response) {
        String nameService = request.getParameter("ten_dich_vu");
        int areaServices = Integer.parseInt(request.getParameter("dien_tich"));
        double costServices = Double.parseDouble(request.getParameter("chi_phi_thue"));
        int maxPeopleServices = Integer.parseInt(request.getParameter("so_nguoi_toi_da"));
        String standardRoom = request.getParameter("tieu_chuan_phong");
        String descriptionOtherConvenience = request.getParameter("mo_ta_tien_nghi_khac");
        double poolArea = Double.parseDouble(request.getParameter("dien_tich_ho_boi"));
        int numberFloor = Integer.parseInt(request.getParameter("so_tang"));
        int idRentType = Integer.parseInt(request.getParameter("ma_kieu_thue"));
        int idServiceType = Integer.parseInt(request.getParameter("ma_loai_dich_vu"));
        Services servicess = new Services(nameService, areaServices, costServices, maxPeopleServices, standardRoom, descriptionOtherConvenience, poolArea, numberFloor, idRentType, idServiceType);
        try {
            services.insertServices(servicess);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/services/create.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showNewForm (HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/services/create.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
