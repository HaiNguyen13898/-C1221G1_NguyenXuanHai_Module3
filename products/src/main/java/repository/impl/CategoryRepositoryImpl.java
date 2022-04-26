package repository.impl;

import model.Category;
import repository.BaseRepository;
import repository.ICategoryRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryRepositoryImpl implements ICategoryRepository {
    private static final String SELECT_All_CATEGORY = "SELECT * FROM category;";
    BaseRepository baseRepository = new BaseRepository();
    @Override
    public List<Category> selectAllCategory() {
        List<Category>  categoryList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = baseRepository.getConnectionJavaToDB().prepareStatement(SELECT_All_CATEGORY);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                 int idCategory = rs.getInt("id_category");
                 String nameCategory = rs.getString("name_category");
                 categoryList.add(new Category(idCategory,nameCategory));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categoryList;
    }

}
