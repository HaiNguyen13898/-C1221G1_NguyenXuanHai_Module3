package repository.impl;

import model.Product;
import repository.BaseRepository;
import repository.IProductRepository;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryImpl implements IProductRepository {

    BaseRepository baseRepository = new BaseRepository();

    private static final String SELECT_All_PRODUCT = "SELECT * FROM product;";
    private static final String INSERT_PRODUCT = "insert into product (name_product, price, quantity, color, id_category) values (?,?,?,?,?);";
    private static final String SELECT_PRODUCT_BY_ID = "SELECT * FROM product WHERE id_product = ?";
    private static final String DELETE_PRODUCT_BY_ID = "call delete_product (?)";
    private static final String UPDATE_PRODUCT = "update product set name_product = ?, price = ?, quantity = ?, color = ?, id_category = ?  WHERE id_product = ? ";
    private static final String SEARCH_PRODUCT = "select * from product  where name_product like ? ";


    @Override
    public void insertProduct(Product product) throws SQLException {
        PreparedStatement preparedStatement = baseRepository.getConnectionJavaToDB().prepareStatement(INSERT_PRODUCT);
        preparedStatement.setString(1, product.getNameProduct());
        preparedStatement.setDouble(2, product.getPrice());
        preparedStatement.setInt(3, product.getQuantity());
        preparedStatement.setString(4, product.getColor());
        preparedStatement.setInt(5, product.getIdCategory());
        preparedStatement.executeUpdate();
    }

    @Override
    public Product selectProduct(int id) {
        Product product = null;
        try {
            PreparedStatement preparedStatement = baseRepository.getConnectionJavaToDB().prepareStatement(SELECT_PRODUCT_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String nameProduct = rs.getString("name_product");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                String color = rs.getString("color");
                int idCategory = rs.getInt("id_category");
                product = new Product(id, nameProduct, price, quantity, color, idCategory);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    @Override
    public List<Product> selectAllProduct() {
        List<Product> productList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = baseRepository.getConnectionJavaToDB().prepareStatement(SELECT_All_PRODUCT);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int idProduct = rs.getInt("id_product");
                String nameProduct = rs.getString("name_product");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                String color = rs.getString("color");
                int idCategory = rs.getInt("id_category");
                productList.add(new Product(idProduct, nameProduct, price, quantity, color, idCategory));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    @Override
    public void deleteProduct(int id) throws SQLException {
        CallableStatement callableStatement = baseRepository.getConnectionJavaToDB().prepareCall(DELETE_PRODUCT_BY_ID);
        callableStatement.setInt(1, id);
        callableStatement.executeUpdate();
    }

    @Override
    public void updateProduct(Product product) throws SQLException {
        PreparedStatement preparedStatement = baseRepository.getConnectionJavaToDB().prepareStatement(UPDATE_PRODUCT);
        preparedStatement.setString(1, product.getNameProduct());
        preparedStatement.setDouble(2, product.getPrice());
        preparedStatement.setInt(3, product.getQuantity());
        preparedStatement.setString(4, product.getColor());
        preparedStatement.setInt(5, product.getIdCategory());
        preparedStatement.setInt(6, product.getIdProduct());
        preparedStatement.executeUpdate();

    }

    @Override
    public List<Product> searchProduct(String name) throws SQLException {
        List<Product> productList = new ArrayList<>();
        PreparedStatement preparedStatement = baseRepository.getConnectionJavaToDB().prepareStatement(SEARCH_PRODUCT);
        preparedStatement.setString(1, "%" + name + "%");
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()) {
            int idProduct = rs.getInt("id_product");
            String nameProduct = rs.getString("name_product");
            double price = rs.getDouble("price");
            int quantity = rs.getInt("quantity");
            String color = rs.getString("color");
            int idCategory = rs.getInt("id_category");
            productList.add(new Product(idProduct, nameProduct, price, quantity, color, idCategory));
        }
        return productList;
    }
}
