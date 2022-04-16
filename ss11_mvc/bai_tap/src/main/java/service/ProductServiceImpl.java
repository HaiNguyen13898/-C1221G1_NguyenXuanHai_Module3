package service;

import model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService {

    private static Map<Integer, Product> products;

    static {
        products = new HashMap<>();
        products.put(1, new Product(1, "Sữa", 200.52, "Vinamilk"));
        products.put(2, new Product(2, "Gà", 500.32, "Vinamilk"));
        products.put(3, new Product(3, "Sữa", 400.56, "Vinamilk"));
        products.put(4, new Product(4, "Sữa", 233.412, "Vinamilk"));
    }


    @Override
    public List<Product> listP() {
        return new ArrayList(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getIdProduct(), product);
    }

    @Override
    public Product findByName(String name) {
        return products.get(name);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id, product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }
}
