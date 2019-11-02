package indhu.niit.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import indhu.niit.dao.CategoryDao;
import indhu.niit.models.Category;

@Controller
public class categorycontroller 
{
	@Autowired
	CategoryDao categoryDao;

	@RequestMapping("admin/category")
	public String showCategory(Model m)
	{
		Category category=new Category();
		List<Category> listcategories=categoryDao.listCategory();
		m.addAttribute(category);
		m.addAttribute("categoryList", listcategories);
		
		return "category";
	}
	
	@RequestMapping(value="/InsertCategory",method=RequestMethod.POST)
	public String saveCategoryDetail(@RequestParam("catName")String categoryName,@RequestParam("catDesc") String categoryDesc,Model m)
	{
		Category category=new Category();
		category.setCategoryName(categoryName);
		category.setCategoryDesc(categoryDesc);
		categoryDao.addCategory(category);
		
	
		List<Category> listcategories=categoryDao.listCategory();
		m.addAttribute("categoryList", listcategories);
		
		return "category";
	}
	
	@RequestMapping(value="/deletecategory/{categoryId}")
	public String deletecategory(@PathVariable("categoryId")int categoryId,Model m)
	{
		Category category=categoryDao.getCategory(categoryId);
		categoryDao.deleteCategory(category);
		
		List<Category> listcategorys=categoryDao.listCategory();
		m.addAttribute("categoryList", listcategorys);
		
		return "category";
	}
	
	@RequestMapping(value="/editcategory/{categoryId}")
	public String editcategory(@PathVariable("categoryId")int categoryId,Model m)
	{
		Category category=categoryDao.getCategory(categoryId);
		m.addAttribute("category",category);
		return "updatecategory";
	}
	
	@RequestMapping(value="/UpdateCategory",method=RequestMethod.POST)
	 public String updateCategory(Model m,@RequestParam("catId")int categoryID,@RequestParam("catName")String categoryName,@RequestParam("catDesc")String categoryDesc)
	 {
		 Category category=categoryDao.getCategory(categoryID);
		 category.setCategoryName(categoryName);
		 category.setCategoryDesc(categoryDesc);
		 categoryDao.updateCategory(category);
		 List<Category> listcategories=categoryDao.listCategory();
		 m.addAttribute("categoryList",listcategories);
		 return "category";
	 }
	
	
}
	
	