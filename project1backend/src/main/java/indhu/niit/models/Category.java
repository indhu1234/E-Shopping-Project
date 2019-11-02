package indhu.niit.models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
public class Category {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
private int categoryId;
private String categoryName;
private String categoryDesc;
@OneToMany(mappedBy="category")
private List<Product> products;



public int getCategoryId() {
	return categoryId;
}
public void setCategoryId(int categoryId) {
	this.categoryId = categoryId;
}
public String getCategoryName() {
	return categoryName;
}
public void setCategoryName(String categoryName) {
	this.categoryName = categoryName;
}
public String getCategoryDesc() {
	return categoryDesc;
}
public void setCategoryDesc(String categoryDesc) {
	this.categoryDesc = categoryDesc;
}
public List<Product> getProducts() {
	return products;
}
public void setProducts(List<Product> products) {
	this.products = products;
}

}
