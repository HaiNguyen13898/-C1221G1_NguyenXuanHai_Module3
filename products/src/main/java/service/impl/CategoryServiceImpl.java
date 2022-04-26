package service.impl;

import model.Category;

import repository.ICategoryRepository;
import repository.impl.CategoryRepositoryImpl;
import service.ICategoryService;

import java.util.List;

public class CategoryServiceImpl implements ICategoryService {
    ICategoryRepository categoryRepository = new CategoryRepositoryImpl();

    @Override
    public List<Category> selectAllCategory() {
        return categoryRepository.selectAllCategory();
    }
}
