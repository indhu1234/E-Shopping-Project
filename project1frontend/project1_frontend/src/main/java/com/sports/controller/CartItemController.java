package com.sports.controller;

import java.security.Principal;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sports.model.Cart;
import com.sports.model.CartItem;
import com.sports.model.Customer;
import com.sports.model.CustomerOrder;
import com.sports.model.Product;
import com.sports.model.ShippingAddress;
import com.sports.model.User;
import com.sports.services.CartItemService;
import com.sports.services.CustomerService;
import com.sports.services.ProductService;

@Controller
public class CartItemController {
	@Autowired
	private CartItemService cartItemService;
	@Autowired
	private ProductService productService;
	@Autowired
	private CustomerService customerService;

	org.springframework.security.core.userdetails.User user;
	@RequestMapping(value="/cart/addtocart/{id}")
	public String addToCart(@AuthenticationPrincipal Principal principal,  @PathVariable int id,@RequestParam int quantity) {
		Product product=productService.getProduct(id);
		String username=principal.getName();
		User user=customerService.getUser(username);
		Customer customer=user.getCustomer();
		Cart cart=customer.getCart();
		List<CartItem> cartItems=cart.getCartItems();
		for(CartItem cartItem:cartItems) {
			if(cartItem.getProduct().getId()==id) {
				cartItem.setQuantity(quantity);
				cartItem.setTotalPrice(cartItem.getQuantity() * product.getPrice() );
				cartItemService.saveOrUpdateCartItem(cartItem);
				return "redirect:/cart/getcart";
			}
		}
		

	
		
		CartItem cartItem=new CartItem();
		cartItem.setQuantity(quantity);
		cartItem.setTotalPrice(cartItem.getQuantity() * product.getPrice());
		cartItem.setCart(cart);
		cartItem.setProduct(product);
		cartItemService.saveOrUpdateCartItem(cartItem);
		return "redirect:/cart/getcart";
	}
	 @RequestMapping(value="/cart/getcart")	
	 public String getCart(@AuthenticationPrincipal Principal principal,Model model) {
		 String username=principal.getName();
		 User user=customerService.getUser(username);
		 Customer customer=user.getCustomer();
		 Cart cart=customer.getCart();
		 model.addAttribute("cart", cart);
		 
		 
		return "cart";
	}
	 
	 @RequestMapping(value="/cart/deletecartitem/{cartItemId}")
		public String removeCartItem(@PathVariable int cartItemId){
			cartItemService.removeCartItem(cartItemId);
			return "redirect:/cart/getcart";
	
	 }
	 
	 @RequestMapping(value="/cart/clearcart/{cartId}")
	    public String clearCart(@PathVariable int cartId){
			Cart cart=cartItemService.getCart(cartId);
			List<CartItem> cartItems=cart.getCartItems();
			for(CartItem cartItem : cartItems){//for(T v:collection)
				cartItemService.removeCartItem(cartItem.getId());//delete from cartitem where id=3
			}
			return "redirect:/cart/getcart";
	}
	 

		@RequestMapping(value="/cart/checkout/{cartId}")
		public String checkout(@PathVariable int cartId,Model model){
			Cart cart=cartItemService.getCart(cartId);
			Customer customer=cart.getCustomer();
			ShippingAddress shippingAddress=customer.getShippingaddress();
			model.addAttribute("shippingaddress",shippingAddress);
			model.addAttribute("cartId",cartId);
			return "shippingAddressForm";
			
		}
	 
		@RequestMapping(value="/cart/createorder/{cartId}")
		//from shippingaddressform.jsp to createOrder method
		public String createOrder(@PathVariable int cartId,@Valid @ModelAttribute ShippingAddress shippingaddress,BindingResult result, Model model){
			
			if(result.hasErrors())
				return "shippingAddressForm";
			Cart cart=cartItemService.getCart(cartId);
			Customer customer=cart.getCustomer();
			customer.setShippingaddress(shippingaddress);//update shippingaddress set.... where customerid=?
			cart.setCustomer(customer);
			CustomerOrder customerOrder=cartItemService.createOrder(cart);//insert into customerorder
			model.addAttribute("order",customerOrder);
			model.addAttribute("cartId", cartId);
			return "orderdetails";
		}
		
		@RequestMapping(value="/cart/confirm/{cartId}")
		public String confirm(@PathVariable int cartId){
			Cart cart=cartItemService.getCart(cartId);
			List<CartItem> cartItems=cart.getCartItems();
			for(CartItem cartItem : cartItems){//for(T v:collection)
				cartItemService.removeCartItem(cartItem.getId());//delete from cartitem where id=3
			}
			return "thanks";
			
		}
}

		


