package indhu.niit.dao;

import java.util.List;

import indhu.niit.models.Category;
import indhu.niit.models.Product;

public interface ProductDao {
Product saveProduct(Product product);//product.id=0, new Object, insert
Product getProduct(int id);

//updated product details
void updateProduct(Product product);//product.id= ,already existing obj, update
void deleteProduct(int id);
List<Product> getAllProducts();//fetch all the records from product table


List<Category> getAllCategories();
}

