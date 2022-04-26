package service;

import model.Product;

import java.sql.SQLException;
import java.util.List;

public interface IProductService {
    void insertProduct(Product product) throws SQLException;

    Product selectProduct(int id);

    List<Product> selectAllProduct();

    void deleteProduct(int id) throws SQLException;

    void updateProduct(Product product) throws SQLException;

    List<Product> searchProduct(String name) throws SQLException;
}
