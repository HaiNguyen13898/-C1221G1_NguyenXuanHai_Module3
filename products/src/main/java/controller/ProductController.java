package controller;

import model.Category;
import model.Product;
import service.ICategoryService;
import service.IProductService;
import service.impl.CategoryServiceImpl;
import service.impl.ProductServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ProductController", value = "/products")

public class ProductController extends HttpServlet {

    IProductService productService = new ProductServiceImpl();
    ICategoryService categoryService = new CategoryServiceImpl();

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
                showEditForm(request,response);
                break;
            default:
                listProduct(request, response);
                break;
        }
    }

    public void listProduct(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = productService.selectAllProduct();
        List<Category> categoryList = categoryService.selectAllCategory();
        request.setAttribute("categoryList", categoryList);
        request.setAttribute("productList", productList);
        try {
            request.getRequestDispatcher("/view/product/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = productService.selectAllProduct();
        request.setAttribute("productList", productList);
        List<Category> categoryList = categoryService.selectAllCategory();
        request.setAttribute("categoryList", categoryList);
        try {
            request.getRequestDispatcher("/view/product/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm (HttpServletRequest request, HttpServletResponse response) {
        List<Category> categoryList = categoryService.selectAllCategory();
        request.setAttribute("categoryList", categoryList);
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.selectProduct(id);
        request.setAttribute("product", product);
        try {
            request.getRequestDispatcher("/view/product/edit.jsp").forward(request,response);
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
                insertProduct(request, response);
                break;
            case "edit":
                updateProduct(request,response);
                break;
            case "delete":
                deleteProduct(request,response);
                break;
            case "search":
                search(request,response);
                break;

        }
    }

    private void insertProduct(HttpServletRequest request, HttpServletResponse response) {
        String nameProduct = request.getParameter("name_product");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String color = request.getParameter("color");
        int idCategory = Integer.parseInt(request.getParameter("id_category"));
        Product product = new Product(nameProduct, price, quantity, color, idCategory);
        try {
            productService.insertProduct(product);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("message", "Đã thêm mới thành công");
        listProduct(request, response);
    }

    private void updateProduct (HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String nameProduct = request.getParameter("name_product");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String color = request.getParameter("color");
        int idCategory = Integer.parseInt(request.getParameter("id_category"));
        Product product = new Product(id,nameProduct, price, quantity, color, idCategory);
        try {
            productService.updateProduct(product);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("message", "Đã sửa thành công");
        listProduct(request, response);
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            productService.deleteProduct(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        List<Product> productList = productService.selectAllProduct();
        request.setAttribute("productList", productList);
        request.setAttribute("message", "Đã xoá thành công");
        listProduct(request, response);
    }
    private void search (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name").toLowerCase();
        List<Product> productList = null;
        try {
            productList = productService.searchProduct(name);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("productList",productList);
        request.getRequestDispatcher("/view/product/list.jsp").forward(request,response);
    }
}
