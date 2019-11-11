package indhu.niit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

public class PaymentController 
{
	@Autowired
	CartItemDao cartDAO;
	
	@Autowired
	UserDao userDAO;
	
	@Autowired
	OrderDao orderDAO;
	
	@RequestMapping(value="/payment")
	public String makePayment(Model m,HttpSession session)
	{
		String username=(String)session.getAttribute("username");
		
		List<CartItem> cartItemList=cartDAO.listCartItems(username);
		m.addAttribute("listCartItems", cartItemList);
		
		m.addAttribute("total_Amount", this.totalCartValue(cartItemList));
		
		m.addAttribute("address", userDAO.getUser(username).getAddress());
	
		
		return "Payment";
	}
	
	@RequestMapping(value="/receipt",method=RequestMethod.POST)
	public String generateReceipt(Model m, HttpSession session,@RequestParam("pmode")String pmode)
	{
		String username=(String)session.getAttribute("username");
		
		List<CartItem> cartItemList=cartDAO.listCartItems(username);
		m.addAttribute("listCartItems", cartItemList);
		
		double total_Amount=this.totalCartValue(cartItemList);
		
		m.addAttribute("total_Amount",total_Amount);
		m.addAttribute("address", userDAO.getUser(username).getAddress());
		
		OrderDetail orderDetail=new OrderDetail();
		orderDetail.setTotalShoppingAmount(total_Amount);
		orderDetail.setUsername(username);
		orderDetail.setOrderDate(new java.util.Date());
		orderDetail.setPmode(pmode);
		
		if(orderDAO.payment(orderDetail))
		{
			orderDAO.updateCartItemStatus(username, orderDetail.getOrderId());
		}
		
		m.addAttribute("order", orderDetail);
		m.addAttribute("address", userDAO.getUser(username).getAddress());
		
		return "Receipt";
	}
	
	public double totalCartValue(List<CartItem> cartItemList)
	{
		double totalCost=0;
		int i=0;
		
		while(i<cartItemList.size())
		{
			CartItem cartItem=cartItemList.get(i);
			totalCost=totalCost+(cartItem.getPrice()*cartItem.getQuantity());
			i++;
		}
		
		return totalCost;
	}


}
