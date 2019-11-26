package indhu.niit.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import indhu.niit.models.Category;
import indhu.niit.models.Product;
//tells the Spring Container to create a bean of type ProductDao
//name of the bean - productDaoImpl
@Repository
@Transactional
public class ProductDaoImpl implements ProductDao {
@Autowired
private SessionFactory sessionFactory;	

public ProductDaoImpl(){
	System.out.println("ProductDaoImpl bean is created");
}


    /**
     * Insert product details into a product table using hibernate framework
     * 1. Get session object from sessionfactory bean
     * 2. using method, insert the data
     */
	public Product saveProduct(Product product) {//id=0,productname="pen",productdesc="pen",price=100,quantity=10
        	Session session=sessionFactory.getCurrentSession();//get session object from SessionFactory
        	System.out.println("Id of the product before persisting " + product.getId());
        	session.save(product); //generate an insert query, insert the data into product table
        	System.out.println("Id of the product after persisting " + product.getId());
        	return product;//id will have some value 
	}

	public Product getProduct(int id) {
		Session session=sessionFactory.getCurrentSession();
		Product product=(Product)session.get(Product.class, id);
		//session.get(Product.class,id) -> select * from product where id=?
		return product;
	}

	public void updateProduct(Product product) {
		Session session=sessionFactory.getCurrentSession();
		session.update(product);//update product set productname=?,productdesc=?,price=?,quantity=? where id=?
		
	}

	public void deleteProduct(int id) {
		Session session=sessionFactory.getCurrentSession();
		//Get product object for the given id
		Product product=(Product)session.get(Product.class, id);
		if(product!=null)
		session.delete(product);//delete from product where id=?
		
	}

	public List<Product> getAllProducts() {
		Session session=sessionFactory.getCurrentSession();
		//from Product -> HQL
		//Product is class name
		//from Product -> Select * from Product -> records from product table
		//record will get converted into product object
		//product object will get added into a list
		// List<Product>
		Query query=session.createQuery("from Product");//Product is an entity 
		List<Product> products=query.list();
		return products;
		
	}


	public List<Category> getAllCategories() {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Category");
		List<Category> categories=query.list();
		return categories;
	}


	@Override
	public List<Product> listProductsCategoryWise(int categoryId) {
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Product where category_categoryId=:catId");
		query.setParameter("catId", categoryId);
		List<Product> productList=query.list();
		session.close();
		return productList;

	}
	
	

}

