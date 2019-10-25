package indhu.niit.project1backend;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import indhu.niit.Configuration.DBConfiguration;
import indhu.niit.dao.ProductDao;
import indhu.niit.dao.ProductDaoImpl;
import indhu.niit.models.Product;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
    	 //TESTING SAVEPRODUCT method in productdaoimpl
    	//USE JUNIT testing tool to test the method
        System.out.println( "Hello World!" );
        //SessionFactory, DataSource,TransactionManager, ProductDaoImpl
        ApplicationContext context=new AnnotationConfigApplicationContext(DBConfiguration.class,ProductDaoImpl.class);
        ProductDao productDao=(ProductDao)context.getBean("productDaoImpl");
        
        Product product=new Product(); //New Product
        product.setProductname("Introduction to Spring framework"); //inserted in the column productname
        product.setProductdesc("2nd Edition"); //column productdesc
        product.setPrice(1000); //column price
        product.setQuantity(10); //column quantity
        //column id =0
        
        productDao.saveProduct(product);//to insert product details into a product table
        
    }
}
