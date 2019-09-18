package pragadeesh.niit.dao;

import pragadeesh.niit.models.Customer;

public interface CustomerDao {
void registerCustomer(Customer customer);
boolean isEmailUnique(String email);
}
