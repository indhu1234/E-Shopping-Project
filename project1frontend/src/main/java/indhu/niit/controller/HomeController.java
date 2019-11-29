package indhu.niit.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import indhu.niit.dao.CartItemDao;
import indhu.niit.dao.CategoryDao;
import indhu.niit.dao.ProductDao;
import indhu.niit.models.CartItem;

@Controller
public class HomeController {
	@Autowired
private ProductDao productDao;	
   @Autowired
	private CartItemDao cartItemDao;
   
   @Autowired
   private CategoryDao categoryDao;
public HomeController(){
	System.out.println("HomeController bean is instantiated");
}
//http://localhost:8080/project1frontend/home - This request will be handled
//by this handler method homePage()
@RequestMapping(value="/home")
public String homePage(HttpSession session,@AuthenticationPrincipal Principal principal){
	/*session.setAttribute("categories",productDao.getAllCategories());*/
	session.setAttribute("categories", categoryDao.listCategory());
	if(principal!=null){
	//String email=principal.getName();
		String username=(String) session.getAttribute("username");
	List<CartItem> cartItems=cartItemDao.listCartItems(username);
	session.setAttribute("cartSize",cartItems.size());
	}
	return "home1";
	}
@RequestMapping(value="/aboutus")
public String aboutusPage(){
	return "aboutus";
}

@RequestMapping(value="/register")
public String showRegister()
{
	return "Register";
}

@RequestMapping(value="/login")
public String login(){
	return "login";
}
@RequestMapping(value="/loginerror")
public String loginFailed(Model model){
	model.addAttribute("error","Invalid credentials..");
	return "login";
}
@RequestMapping(value="/logout")
public String logout(Model model){
	model.addAttribute("msg","Loggedout successfully...");
	return "login";
}
}
