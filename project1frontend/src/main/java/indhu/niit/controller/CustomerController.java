package indhu.niit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import indhu.niit.dao.CustomerDao;
import indhu.niit.dao.UserDao;
import indhu.niit.models.Customer;
import indhu.niit.models.UserDetail;

@Controller
public class CustomerController {
	@Autowired
	private CustomerDao customerDao;
	@Autowired
	UserDao userDao;
	
@RequestMapping(value="/all/registrationform")
public String getRegistrationForm(Model model){
	model.addAttribute("user",new UserDetail());
	return "register";
}

@RequestMapping(value="/all/registercustomer")
public String registerUser(@RequestParam String customer,@RequestParam String username,@RequestParam String password, @RequestParam String emailid,@RequestParam String street,@RequestParam String city,@RequestParam String zip, @RequestParam String mobile, Model m )
{
     UserDetail user=new UserDetail();
     user.setUsername(username);
     user.setPassword(password);
     user.setCustomerName(customer);
     user.setEmailId(emailid);
     user.setStreet(street);
     user.setCity(city);
     user.setZip(zip);
     user.setMobileNo(mobile);
     user.setEnabled(true);
     user.setRole("ROLE_USER");
     
     userDao.registerUser(user);
     return "login";
}




/*public String registerCustomer(@ModelAttribute(name="customer") Customer customer,Model model){

	//CHECK if Email is unique
	if(!customerDao.isEmailUnique(customer.getUser().getEmail())){
		model.addAttribute("error","Email id already exists.. please choose different email id");
		return "registrationform";
	}
	
	//Call DAO to persist customer details
	customerDao.registerCustomer(customer);
	return "login";
}*/



}
