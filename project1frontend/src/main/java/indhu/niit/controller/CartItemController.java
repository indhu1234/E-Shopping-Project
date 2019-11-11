package indhu.niit.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import indhu.niit.dao.CartItemDao;
import indhu.niit.dao.ProductDao;
import indhu.niit.models.CartItem;
import indhu.niit.models.Customer;
import indhu.niit.models.CustomerOrder;
import indhu.niit.models.Product;
import indhu.niit.models.ShippingAddress;
import indhu.niit.models.User;

@Controller
public class CartItemController {
	@Autowired
private CartItemDao cartItemDao;
	@Autowired
	private ProductDao productDao;
	
    @RequestMapping(value="/cart/addtocart/{productId}")//5
	public String addToCart(@PathVariable int productId,@RequestParam int requestedQuantity
			,@AuthenticationPrincipal Principal principal,HttpSession session){//in jsp userPrincipal, in controller Principal
    	if(principal==null)
    		return "login";
		//String email=principal.getName();
    	String username=(String) session.getAttribute("username");
		Product product=productDao.getProduct(productId);
		//User user=cartItemDao.getUser(username);
		List<CartItem> cartItems=cartItemDao.listCartItems(username);
		for(CartItem cartItem:cartItems){
			if(cartItem.getProduct().getId()==productId){
				cartItem.setQuantity(requestedQuantity);
				cartItem.setPrice(requestedQuantity*product.getPrice());
				cartItemDao.addToCart(cartItem);//update the quantity and totalprice
				return "redirect:/cart/getcart";
			}
		}
		
		CartItem cartItem=new CartItem();
		cartItem.setQuantity(requestedQuantity);
        cartItem.setProduct(product);
        cartItem.setUsername(username);
        double totalPrice=requestedQuantity *product.getPrice();
        cartItem.setPrice(totalPrice);
        cartItemDao.addToCart(cartItem);
    	return "redirect:/cart/getcart";
	}
    @RequestMapping(value="/cart/getcart")
    public String getCart(@AuthenticationPrincipal Principal principal,Model model,HttpSession session){
    	if(principal==null)
    		return "login";
    	CartItem cartitem=new CartItem();
    	//String email=principal.getName();
    	String username=(String) session.getAttribute("username");
    	model.addAttribute(cartitem);
    	List<CartItem> cartItems=cartItemDao.listCartItems(username);
    	model.addAttribute("cartItems",cartItems);
    	model.addAttribute("total_Amount",this.totalCartValue(cartItems));
    	model.addAttribute("username",username);
    	session.setAttribute("cartSize", cartItems.size());
    	
    	return "cart";
    }
    @RequestMapping(value="/cart/removecartitem/{cartItemId}")
    public String removeCartItem(@PathVariable int cartItemId){
    	CartItem cartItem=cartItemDao.getCartItem(cartItemId);
    	cartItemDao.deleteCartItem(cartItem);
    	//delete from cartItem where cartitemid=?
    	return "redirect:/cart/getcart";
    	
    	//select * from cartitem where user_email=? - to execute the query redirect /cart/getcart
    }
   /* @RequestMapping(value="/cart/editCart/{cartItemId}")
	public String editCategory(@PathVariable("cartItemId") int cartid,Model m)
	{
		CartItem cartitem=(CartItem) cartItemDao.updateCartItem(cartItem);
		
    	m.addAttribute("cartitem",cartitem);
		return "updatecarts";
	}*/
	
   @RequestMapping(value="/cart/updateCart/{cartItemId}")
    public String updateCart(@PathVariable("cartItemId") int cartitemId,@RequestParam("quantity") int quantity,Model m,HttpSession session )
    {
    	CartItem cartitem=cartItemDao.getCartItem(cartitemId);
    	cartitem.setQuantity(quantity);
    	cartItemDao.updateCartItem(cartitem);
    	//String email=cartitem.getUser().getEmail();
    	String username=(String) session.getAttribute("username");
    	List<CartItem> cartItemList=cartItemDao.listCartItems(username);
    	m.addAttribute("listCartItems",cartItemList);
    	m.addAttribute("total_Amount",this.totalCartValue(cartItemList));
    	System.out.println("Sub Total : "+totalCartValue(cartItemList));
    	System.out.println(cartitem.getQuantity());
    	System.out.println(cartitem.getPrice());
    	//update from cartItem where cartitemid=?	
    	//return "redirect:/cart/updatecarts";
    	

    	return "cart";	
    	//select * from cartitem where user_email=? - to execute the query redirect /cart/getcart
    }
    
   public double totalCartValue(List<CartItem> cartItemList)
   {
	   double totalCost=0;
	   int i=0;
	   while(i<cartItemList.size())
	   {
		  /* CartItem cartitem=cartItemList.get(i);
		   totalCost=totalCost+(cartItemList.getPrice() * cartitemList.getQuantity());*/
		   totalCost+=(cartItemList.get(i).getQuantity() * cartItemList.get(i).getPrice());
		   i++;
	   }
	   //System.out.println("Total Cost : "+totalCost);
	   return totalCost;
   }
   
  /*  RequestMapping(value="/cart/updateCart",method=RequestMethod.POST)
	 public String updateCategory(Model m,@RequestParam("cartItemId")int cartid,@RequestParam("ProdName")String prodName,@RequestParam("ProdDesc")String proddesc,@RequestParam("Qty") int qty)
	 {
		 CartItem cartitem=cartItemDao.getCartById(cartid).getCategory(categoryID);
		 cartitem.setCategoryName(categoryName);
		 category.setCategoryDesc(categoryDesc);
		 categoryDAO.updateCategory(category);
		 List<Category> listCategories=categoryDAO.listCategories();
		 m.addAttribute("categoryList",listCategories);
		 return "category";
	 }*/
    
  /* @RequestMapping(value="/cart/updateCart")
   public String updateCart(@ModelAttribute CartItem cartitem,Model m)
   {
	   System.out.println(cartitem.getQuantity());
	   System.out.println(cartitem.getTotalPrice());
	   cartItemDao.cartupdate(cartitem.getQuantity());
	   m.addAttribute("cartItems",cartitem);
	   
	   return "cart";
   }*/
   
   
   /* public String updateCart(@Valid @ModelAttribute CartItem cartitem,BindingResult result,Model model,HttpServletRequest request){//product will have updated values
      
    	cartItemDao.updateCart(cartitem.getCartItemId());
    	
    	
    	MultipartFile img=cartitem.getProduct().getImage();
    	System.out.println(request.getServletContext().getRealPath("/"));
    	//Defining a path
    	Path path=Paths.get(request.getServletContext().getRealPath("/")+"/WEB-INF/resources/images/"+cartitem.getProduct().getId()+".png");
    	//transfer the image to the file
    	
     	return "cart";
    }*/

   


    
   
    
    
   /* @RequestMapping(value="/cart/clearcart")
    public String clearCart(@AuthenticationPrincipal Principal principal){
    	//Get list of cartItems 
    	List<CartItem> cartItems=cartItemDao.getCart(principal.getName());
     	for(CartItem cartItem:cartItems){
    		cartItemDao.removeCartItem(cartItem.getCartItemId());
    		//delete from cartItem where cartItemid=?
    	}
    	return "redirect:/cart/getcart";
    }
    @RequestMapping(value="/cart/shippingaddressform")
    public String getShippingAddressForm(@AuthenticationPrincipal Principal principal,Model model){
    	if(principal==null)
    		return "login";
    	String email=principal.getName();
    	User user=cartItemDao.getUser(email);
    	Customer customer=user.getCustomer();
    	ShippingAddress shippingAddress=customer.getShippingaddress();
    	model.addAttribute("shippingaddress",shippingAddress);
    	return "shippingaddress";
    }*/
    /*@RequestMapping(value="/cart/createorder")
    public String createCustomerOrder(@ModelAttribute ShippingAddress shippingaddress,
    		Model model,
    		@AuthenticationPrincipal Principal principal,HttpSession session){
    	String email=principal.getName();
    	User user=cartItemDao.getUser(email);
    	
    	Customer customer=user.getCustomer();
    	customer.setShippingaddress(shippingaddress);//customer.shippingaddress -> updated shippingaddress obj
    	customer.setUser(user);
    	user.setCustomer(customer);//user.customer -> updated customer references
    	
    	
    	List<CartItem> cartItems=cartItemDao.getCart(email);
    	
    	for(CartItem cartItem:cartItems){
    		Product product=cartItem.getProduct();
    		if((product.getQuantity()-cartItem.getQuantity())<0){
    			cartItemDao.removeCartItem(cartItem.getCartItemId());
    			model.addAttribute("productNA",product);
    			return "productnotavailable";
    		}
    	}
    	
    	//Calculate grandTotal
    	
    	double grandTotal=0;
    	for(CartItem cartItem:cartItems){//for(T o:collection)
    		grandTotal=grandTotal+cartItem.getPrice();
    	}
    	
    	//create CustomerOrder object
    	CustomerOrder customerOrder=new CustomerOrder();
    	customerOrder.setPurchaseDate(new Date());
    	customerOrder.setUser(user);//customerOrder -> user -> customer -> shippingaddress
    	customerOrder.setGrandTotal(grandTotal);
    	if(cartItems.size()>0)
    	 customerOrder=cartItemDao.createCustomerOrder(customerOrder);
    	 
    	 
    	//Remove all cartitems from the cartItem table
    	//decrement the quantity of the product
    	//add customerorder and List<CartItem> to an model attributes and return "orderdetails"
    	 
    	for(CartItem cartItem:cartItems){
    		Product product=cartItem.getProduct();
    		//In stock =30
    		//requested quantity=20
    		//update product quantity=30-20 where id=?
    		product.setQuantity(product.getQuantity() - cartItem.getQuantity());//decrement the product quantity
    		productDao.updateProduct(product );//update product set quantity=7 where id=38
    		cartItemDao.removeCartItem(cartItem.getCartItemId());
    	}
    	model.addAttribute("customerorder",customerOrder);//order=[orderId,purchaseDate,grandTotal,User]
    	model.addAttribute("cartItems",cartItems);
    	session.setAttribute("cartSize", 0);
    	return "orderDetails";
    }
    */
    
    @RequestMapping(value="/confirmOrder")
    public String confirmOrder(Model m,HttpSession session)
    {
    	String username=(String) session.getAttribute("username");
    	List<CartItem> cartItemList=cartItemDao.listCartItems(username);
    	m.addAttribute("listCartItems",cartItemList);
    	m.addAttribute("total_Amount",this.totalCartValue(cartItemList));
    	return "orderDetails";
    	
    }
    
}

