package indhu.niit.dao;

import java.util.List;

import indhu.niit.models.Category;

public interface CategoryDao 
{
	public boolean addCategory(Category category);
	public boolean deleteCategory(Category category);
	public boolean updateCategory(Category category);
	public Category getCategory(int categoryId);
	public List<Category> listCategory();
}
