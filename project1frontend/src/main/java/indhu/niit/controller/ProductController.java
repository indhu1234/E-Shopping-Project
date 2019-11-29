package indhu.niit.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import indhu.niit.dao.CategoryDao;
import indhu.niit.dao.ProductDao;
import indhu.niit.dao.SupplierDao;
import indhu.niit.models.Category;
import indhu.niit.models.Product;

@Controller
public class ProductController {
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private CategoryDao categoryDao;
	
	
	@Autowired
	private SupplierDao supplierdao;
public ProductController(){
	System.out.println("ProductController Bean is Created");
}

@RequestMapping(value="/all/getallproducts")
public String getAllProducts(Model model){
	List<Product> products=productDao.getAllProducts();
	//Attribute name is the Key - productList
	//value - List<Product> products is the data
	model.addAttribute("productsList",products);
	//                 attributename   data
	/*return "listofproducts";*///logical view name
	//in listofproducts.jsp,access the model attribute "productsList"
	return "listofproducts";
}

@RequestMapping(value="/all/getproduct/{id}")
public String getProduct(@PathVariable int id,Model model)
{
	Product product=productDao.getProduct(id);
	model.addAttribute("productObj",product);
	List<Product> products=productDao.getAllProducts();
		model.addAttribute("productsList",products);
	return "viewproduct";
}

@RequestMapping(value="/admin/deleteproduct/{id}")
public String deleteProduct(@PathVariable int id,Model model,HttpServletRequest request){
	productDao.deleteProduct(id);
	Path path=Paths.get(request.getServletContext().getRealPath("/")+"/WEB-INF/resources/images/"+id+".jpg");
	if(Files.exists(path)){
		try {
			Files.delete(path);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	return "redirect:/all/getallproducts";
}
@RequestMapping(value="/admin/getproductform")
public String getproductform(Model model){
	Product p=new Product();
	model.addAttribute("product",p);
	
	model.addAttribute("categories",productDao.getAllCategories());
	//In productform, access  the values of all the properties of product p
	//in the form, p.getId(),p.getProductname(),p.getPrice(),p.getQuantity(),p.getProductdesc()
	return "productform";
}

@RequestMapping(value="/admin/addproduct")
public String addProduct(@Valid @ModelAttribute(name="product") Product product,
		BindingResult result,Model model ,HttpServletRequest request ){
	//after validation, if result has any errors

	if(result.hasErrors()){//if it is true, result has errors
		model.addAttribute("categories",productDao.getAllCategories());
		List<Product> listproducts=productDao.getAllProducts();
		model.addAttribute("productsList",listproducts);
		return "productform";
	}
	
	productDao.saveProduct(product);
	
	MultipartFile img=product.getImage();
	System.out.println(request.getServletContext().getRealPath("/"));
	//Defining a path
	Path path=Paths.get(request.getServletContext().getRealPath("/")+"/WEB-INF/resources/images/"+product.getId()+".jpg");
	//transfer the image to the file

	if(!img.isEmpty()&&img!=null){
		try {
			img.transferTo(new File(path.toString()));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	return "redirect:/all/getallproducts";
}

@RequestMapping(value="/admin/getupdateform/{id}")
public String getUpdateProductForm(@PathVariable int id,Model model){
	//how to get the product?
	Product product=productDao.getProduct(id);
	model.addAttribute("product",product);
	model.addAttribute("categories",productDao.getAllCategories());
	return "updateproductform";
}
@RequestMapping(value="/admin/updateproduct")
public String updateProduct(@Valid @ModelAttribute Product product,BindingResult result,Model model,HttpServletRequest request){//product will have updated values
   if(result.hasErrors()){
	   model.addAttribute("categories",productDao.getAllCategories());
	   return "updateproductform";
   }
	productDao.updateProduct(product);
	MultipartFile img=product.getImage();
	System.out.println(request.getServletContext().getRealPath("/"));
	//Defining a path
	Path path=Paths.get(request.getServletContext().getRealPath("/")+"/WEB-INF/resources/images/"+product.getId()+".jpg");
	//transfer the image to the file
	if(!img.isEmpty()&&img!=null){
		try {
			img.transferTo(new File(path.toString()));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	return "redirect:/all/getallproducts";
}

@RequestMapping(value="/all/category/{categoryId }")
public String showproductcategorywise(@RequestParam int categoryId,Model m,HttpServletRequest request)
{
	
	System.out.println("Show Category Id : "+categoryId);
    /*m.addAttribute("productsList",productDao.listProductsCategoryWise(categoryid));*/
	List<Product> productList=productDao.listProductsCategoryWise(categoryId);
	m.addAttribute("productsList", productList);
	
	List<Category> categoryList=categoryDao.listCategory();
	m.addAttribute("categoryList",this.getCategoryList(categoryList));
	
	
	return "viewproduct";

}

@RequestMapping(value="/all/productdisplay")
public String productdisplay(Model m)
{
	List<Product> productlist=productDao.getAllProducts();
	m.addAttribute("productsList",productlist);
	
	List<Category> categorylist=categoryDao.listCategory();
	m.addAttribute("categoryList",this.getCategoryList(categorylist));
	 
	return "listofproducts";
}



@RequestMapping(value="/all/searchByCategory")
public String searchByCategory(@RequestParam int searchCondition ,Model model){
	if(searchCondition==0)
		model.addAttribute("searchCondition","");
	else
	model.addAttribute("searchCondition",searchCondition);
	model.addAttribute("productsList",productDao.getAllProducts());
	return "listofproducts";
	
}
public LinkedHashMap<Integer,String> getCategoryList(List<Category> categoryList)
{
	LinkedHashMap<Integer,String> categoryList1=new LinkedHashMap<Integer,String>();
	
	for(Category category:categoryList)
	{
		categoryList1.put(category.getCategoryId(), category.getCategoryName());
	}
	return categoryList1;
}



@RequestMapping(value="/all/vegetables")
public String showvegetables(Model m)
{
	List<Product> productList=productDao.listProductsCategoryWise(2);
	m.addAttribute("productsList", productList);
	
	List<Category> categoryList=categoryDao.listCategory();
	m.addAttribute("categoryList",this.getCategoryList(categoryList));
	
	return "vegetables";
}
@RequestMapping(value="/all/fruits")
public String showfruits(Model m)
{
	List<Product> productList=productDao.listProductsCategoryWise(3);
	m.addAttribute("productsList", productList);
	
	List<Category> categoryList=categoryDao.listCategory();
	m.addAttribute("categoryList",this.getCategoryList(categoryList));
	
	return "fruits";
}

@RequestMapping(value="/all/nuts")
public String shownuts(Model m)
{
	List<Product> productList=productDao.listProductsCategoryWise(6);
	m.addAttribute("productsList", productList);
	
	List<Category> categoryList=categoryDao.listCategory();
	m.addAttribute("categoryList",this.getCategoryList(categoryList));
	
	return "nuts";
}
@RequestMapping(value="/all/oils")
public String showoils(Model m)
{
	List<Product> productList=productDao.listProductsCategoryWise(4);
	m.addAttribute("productsList", productList);
	
	List<Category> categoryList=categoryDao.listCategory();
	m.addAttribute("categoryList",this.getCategoryList(categoryList));
	
	return "oils";
}
@RequestMapping(value="/all/rice")
public String showrice(Model m)
{
	List<Product> productList=productDao.listProductsCategoryWise(5);
	m.addAttribute("productsList", productList);
	
	List<Category> categoryList=categoryDao.listCategory();
	m.addAttribute("categoryList",this.getCategoryList(categoryList));
	
	return "rice";
}




}


