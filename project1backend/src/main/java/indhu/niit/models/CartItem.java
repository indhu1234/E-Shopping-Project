package indhu.niit.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class CartItem {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
private int cartItemId;
	@ManyToOne
private Product product;
	@ManyToOne
private User user;
public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
private int quantity;
private double price;
String username;
String status;

public int getCartItemId() {
	return cartItemId;
}
public void setCartItemId(int cartItemId) {
	this.cartItemId = cartItemId;
}
public Product getProduct() {
	return product;
}
public void setProduct(Product product) {
	this.product = product;
}
public User getUser() {
	return user;
}
public void setUser(User user) {
	this.user = user;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}


}

