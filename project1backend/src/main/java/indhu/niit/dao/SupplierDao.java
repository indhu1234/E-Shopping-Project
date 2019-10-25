package indhu.niit.dao;

import java.util.List;
import indhu.niit.models.Supplier;
public interface SupplierDao 
{
	public boolean addSupplier(Supplier supplier);
	public boolean deleteSupplier(Supplier supplier);
	public boolean updateSupplier(Supplier supplier);
	public Supplier getSupplier(int supplierId);
	public List<Supplier> listSuppliers();
}
