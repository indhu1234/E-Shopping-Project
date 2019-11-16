package indhu.niit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import indhu.niit.dao.CartItemDao;
import indhu.niit.dao.CustomerDao;
import indhu.niit.dao.OrderDao;
import indhu.niit.dao.UserDao;
import indhu.niit.models.CartItem;
import indhu.niit.models.OrderDetail;
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
		
		double total_Amount=this.totalCartValue(cartItemList);
		
		m.addAttribute("total_Amount",total_Amount);
		//m.addAttribute("address", userDAO.getUser(username).getAddress());
		
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
		
		//m.addAttribute("address", userDAO.getUser(username).getAddress());
		
			
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

@RequestMapping(value="/receipt/shipping")
public String shipping(Model m)
{
	UserDetail user=new UserDetail();
	m.addAttribute(user);
	return "shippingaddress";
}
}
