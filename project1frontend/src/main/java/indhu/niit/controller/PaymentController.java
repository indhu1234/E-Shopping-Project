package indhu.niit.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import indhu.niit.dao.CartItemDao;
import indhu.niit.dao.CustomerDao;
import indhu.niit.dao.OrderDao;
import indhu.niit.dao.UserDao;
import indhu.niit.dao.shippingdao;
import indhu.niit.models.CartItem;
import indhu.niit.models.OrderDetail;
import indhu.niit.models.ShippingAddress;
import indhu.niit.models.UserDetail;

@Controller
public class PaymentController 
{
	@Autowired
	CartItemDao cartItemDao;
	
	@Autowired
	UserDao userDAO;
	
	@Autowired
	OrderDao orderDAO;
	
	@Autowired
	shippingdao shipping;
	
	@RequestMapping(value="/cart/paymentpage")
	
		public String showPayment()
		{
			return "Payment";
		}
	
	
	@RequestMapping(value="/cart/payment")
	public String makePayment(Model m,HttpSession session)
	{
		SecurityContext scontext=SecurityContextHolder.getContext();
    	Authentication authentication=scontext.getAuthentication();
		String username=authentication.getName();

		session.setAttribute("username", username);

		
		String uname=(String)session.getAttribute("username");
		
		List<CartItem> cartItemList=cartItemDao.listCartItems(uname);
		m.addAttribute("listCartItems", cartItemList);
		
		m.addAttribute("total_Amount", this.totalCartValue(cartItemList));
		UserDetail user=userDAO.getUser(uname);
		session.setAttribute("user", user);
		m.addAttribute("user",user);
		m.addAttribute("street", userDAO.getUser(username).getStreet());
		m.addAttribute("city",userDAO.getUser(username).getCity());
		m.addAttribute("zip",userDAO.getUser(username).getZip());
		m.addAttribute("mobile",userDAO.getUser(username).getMobileNo());
	
		
		return "Payment";
	}

	@RequestMapping(value="/cart/receipt",method=RequestMethod.POST)
	public String generateReceipt(Model m, HttpSession session,@RequestParam("pmode")String pmode)
	{
		SecurityContext scontext=SecurityContextHolder.getContext();
    	Authentication authentication=scontext.getAuthentication();
		String username=authentication.getName();

		session.setAttribute("username", username);

		String uname=(String)session.getAttribute("username");
		
		List<CartItem> cartItemList=cartItemDao.listCartItems(uname);
		m.addAttribute("listCartItems", cartItemList);
	    session.setAttribute("cartList",cartItemList);	
		double total_Amount=this.totalCartValue(cartItemList);
		
		m.addAttribute("total_Amount",total_Amount);
		//m.addAttribute("address", userDAO.getUser(username).getAddress());

		session.setAttribute("total_Amount", total_Amount);
		UserDetail user=(UserDetail) session.getAttribute("user");
		user=userDAO.getUser(uname);
		m.addAttribute("user",user);
		m.addAttribute("customer",userDAO.getUser(uname).getCustomerName());
		m.addAttribute("street", userDAO.getUser(uname).getStreet());
		m.addAttribute("city",userDAO.getUser(uname).getCity());
		m.addAttribute("zip",userDAO.getUser(uname).getZip());
		m.addAttribute("mobile",userDAO.getUser(uname).getMobileNo());
	
		
		OrderDetail orderDetail=new OrderDetail();
		orderDetail.setTotalShoppingAmount(total_Amount);
		orderDetail.setUsername(uname);
		orderDetail.setOrderDate(new java.util.Date());
		orderDetail.setPmode(pmode);
		
		if(orderDAO.payment(orderDetail))
		{
			orderDAO.updateCartItemStatus(uname, orderDetail.getOrderId());
		}
		
		m.addAttribute("order", orderDetail);
		session.setAttribute("pmode", pmode);
		session.setAttribute("total_Amount", total_Amount);
		session.setAttribute("order",orderDetail);
		session.setAttribute("id", orderDetail.getOrderId());
		//m.addAttribute("address", userDAO.getUser(username).getAddress());
        
		ShippingAddress address1=(ShippingAddress) session.getAttribute("shipaddress");
        
		m.addAttribute("id",shipping.getAddressById(address1.getId()).getId());
		m.addAttribute("dno",shipping.getAddressById(address1.getId()).getApartmentnumber());
		m.addAttribute("street1",shipping.getAddressById(address1.getId()).getStreetname());
		m.addAttribute("city1",shipping.getAddressById(address1.getId()).getCity());
		m.addAttribute("zip1",shipping.getAddressById(address1.getId()).getZipcode());
		m.addAttribute("mobile",shipping.getAddressById(address1.getId()).getMobile());
	    m.addAttribute("addr",shipping.getAddressById(address1.getId()));
		session.setAttribute("address1", address1);
		System.out.println("Ship id : "+shipping.getAddressById(address1.getId()).getId());
		System.out.println("Street : "+shipping.getAddressById(address1.getId()).getStreetname());
			
		return "Receipt";
	}
	
	public double totalCartValue(List<CartItem> cartItemList)
	{
		double totalCost=0;
		int i=0;
		
		while(i<cartItemList.size())
		{
			CartItem cartItem=cartItemList.get(i);
			//totalCost=totalCost+(cartItem.getPrice()*cartItem.getQuantity());
			 totalCost+=(cartItem.getProduct().getPrice()*cartItem.getQuantity());
			i++;
		}
		
		return totalCost;
	}

@RequestMapping(value="/cart/shipping")
public String showshipping(Model m,HttpSession session)
{
	SecurityContext scontext=SecurityContextHolder.getContext();
	Authentication authentication=scontext.getAuthentication();
	String username=authentication.getName();

	session.setAttribute("username", username);

	
	String uname=(String)session.getAttribute("username");
	
	List<CartItem> cartItemList=cartItemDao.listCartItems(uname);
	m.addAttribute("listCartItems", cartItemList);
	
	
	double total_Amount=this.totalCartValue(cartItemList);
	
	m.addAttribute("total_Amount",total_Amount);

	ShippingAddress address=new ShippingAddress();
	m.addAttribute("shippingaddress",address);
	return "shippingaddress";
}
@RequestMapping(value="/cart/address")
public String shipping(@RequestParam("apartmentnumber") String apartmentnumber,@RequestParam("streetname") String street, @RequestParam("city") String city, @RequestParam("state") String state, @RequestParam("country") String country,@RequestParam("zipcode") String zipcode, @RequestParam String mob,HttpSession session,Model m)
{
   
	SecurityContext scontext=SecurityContextHolder.getContext();
	Authentication authentication=scontext.getAuthentication();
	String username=authentication.getName();

	session.setAttribute("username", username);

	
	String uname=(String)session.getAttribute("username");
	
	
	ShippingAddress address1=new ShippingAddress();
	address1.setApartmentnumber(apartmentnumber);
	address1.setCity(city);
	address1.setCountry(country);
	
	address1.setState(state);
	address1.setStreetname(street);
	address1.setZipcode(zipcode);
	address1.setUsername(uname);
	address1.setMobile(mob);
	shipping.addshipping(address1);
	
	
	session.setAttribute("shipaddress",address1);
	List<CartItem> cartItemList=cartItemDao.listCartItems(uname);
	m.addAttribute("listCartItems", cartItemList);
	
	
	double total_Amount=this.totalCartValue(cartItemList);
	
	m.addAttribute("total_Amount",total_Amount);

		return "Payment";
}

@RequestMapping(value="/receipt/ship/{id}")
public String updateship(@PathVariable int id,@RequestParam String dno,@RequestParam String street,@RequestParam String city,@RequestParam String zip,@RequestParam String mob,Model m,HttpSession session)
{

	SecurityContext scontext=SecurityContextHolder.getContext();
	Authentication authentication=scontext.getAuthentication();
	String username=authentication.getName();

	session.setAttribute("username", username);

	
	String uname=(String)session.getAttribute("username");
    UserDetail user=userDAO.getUser(uname);

    m.addAttribute("user",user);
	m.addAttribute("customer",userDAO.getUser(uname).getCustomerName());
	m.addAttribute("street", userDAO.getUser(uname).getStreet());
	m.addAttribute("city",userDAO.getUser(uname).getCity());
	m.addAttribute("zip",userDAO.getUser(uname).getZip());
	m.addAttribute("mobile",userDAO.getUser(uname).getMobileNo());

	
	
	ShippingAddress address1=(ShippingAddress) session.getAttribute("address1");
	address1.setApartmentnumber(dno);
	address1.setStreetname(street);
	address1.setCity(city);
	address1.setZipcode(zip);
	shipping.updateAddress(address1);	
	
	List<CartItem> cartItemList=cartItemDao.listCartItems(uname);
	m.addAttribute("cartItems",cartItemList);

	//double total_Amount=this.totalCartValue(cartItemList);
	double total_Amount=(double) session.getAttribute("total_Amount");
	m.addAttribute("total_Amount",total_Amount);
	
	m.addAttribute("addr",shipping.getAddressById(address1.getId()));
	System.out.println("Sub Total : "+totalCartValue(cartItemList));

	OrderDetail order=(OrderDetail) session.getAttribute("order");
	m.addAttribute("order",orderDAO.getOrder(order.getOrderId()));
	m.addAttribute("orderId",orderDAO.getOrder(order.getOrderId()).getOrderId());
	m.addAttribute("date",orderDAO.getOrder(order.getOrderId()).getOrderDate());
	m.addAttribute("pmode",session.getAttribute("pmode"));
    m.addAttribute("order",order);
	List<CartItem> cartlist=(List<CartItem>) session.getAttribute("cartList");
	m.addAttribute("listCartItems", cartlist);
    return "updateReceipt";
}


}
