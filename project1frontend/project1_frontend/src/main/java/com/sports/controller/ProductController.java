package com.sports.controller;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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

import org.springframework.web.servlet.ModelAndView;

import com.sports.model.Category;
import com.sports.model.Product;
import com.sports.services.ProductService;


@Controller
public class ProductController {


	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="/all/getallproducts")
	public ModelAndView getAllProducts() {
		List<Product> products=productService.getAllProducts();
		//productlist - logical view name [productlist.jsp]
		//products - model attribute [use this attribute in jsp]
		//products - List<Product> data 
		return new ModelAndView("productlist","productsAttr",products);
		//JSTL and EL 
		
	}
	@RequestMapping(value="all/viewproduct/{id}")
	public ModelAndView getProduct(@PathVariable int id) {
		Product product=productService.getProduct(id);
		return new ModelAndView("viewproduct","product",product);
	}
	
	@RequestMapping(value="/admin/deleteproduct/{id}")
	public String deleteProduct(HttpServletRequest request, @PathVariable int id){
		String rootDirectory=request.getServletContext().getRealPath("/");
		Path path=Paths.get(rootDirectory + "/WEB-INF/resources/images/"+id+".png");
		if(Files.exists(path)){
			try {
				Files.delete(path);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		productService.deleteProduct(id);
		return "redirect:/all/getallproducts";
	
	}
	
	@RequestMapping(value="/admin/getproductform")
	public String getProductForm(@RequestParam(required=false)int id,Model model){
		if(id==0)//add product
		model.addAttribute("product",new Product());//1
		else{
			Product product=productService.getProduct(id);//select * from product where id=?
			model.addAttribute("product",product);
		}
		//SELECT * from Category
		List<Category> categoriesList=productService.getAllCategories();
		model.addAttribute("categories",categoriesList);
		return "productform";
		
	}
	@RequestMapping(value="/admin/saveorupdateproduct")
    public String saveorUpdateProduct(HttpServletRequest request,@Valid @ModelAttribute(name="product")  Product product,BindingResult result,Model model){//3
    
    	if(result.hasErrors()){//constraint violation
    		List<Category> categories=productService.getAllCategories();
			model.addAttribute("categories",categories);
    		
			return "productform";
    	}
    	System.out.println(product.getProductname());
    	productService.saveOrUpdateProduct(product); //insert and update
    	String rootDirectory=request.getServletContext().getRealPath("/");
    	System.out.println(rootDirectory);
    	Path path=Paths.get(rootDirectory + "/WEB-INF/resources/images/"+product.getId()+".png");
    	MultipartFile prodImage=product.getImage();//uploaded image [jpeg,gif,..]
    	try {
			prodImage.transferTo(new File(path.toString()));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//transfer the image to the file named productid.png
    	
    	
    	
    	return "redirect:/all/getallproducts";
	}
	
		@RequestMapping("/all/product/searchbycategory")
    	public String selectByCategory(@RequestParam String searchCondition,Model model) {
    		model.addAttribute("productsAttr", productService.getAllCategories());
    		if(searchCondition.equals("All"))
    			model.addAttribute("searchCondition", "");
    		else
    			model.addAttribute("searchCondition", searchCondition);
    		return "productList";
    	
    		
			
			
			
			
    }		
			
			
}


