package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepositoryImpl;
import service.IProductService;

import java.sql.SQLException;
import java.util.List;

public class ProductServiceImpl implements IProductService {

    IProductRepository productRepository = new ProductRepositoryImpl();

    @Override
    public void insertProduct(Product product) throws SQLException {
        productRepository.insertProduct(product);
    }

    @Override
    public Product selectProduct(int id) {
        return productRepository.selectProduct(id);
    }

    @Override
    public List<Product> selectAllProduct() {
        return productRepository.selectAllProduct();
    }

    @Override
    public void deleteProduct(int id) throws SQLException {
        productRepository.deleteProduct(id);
    }

    @Override
    public void updateProduct(Product product) throws SQLException {
        productRepository.updateProduct(product);
    }

    @Override
    public List<Product> searchProduct(String name) throws SQLException {
        return productRepository.searchProduct(name);
    }
}
