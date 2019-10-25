package indhu.niit.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import indhu.niit.dao.SupplierDao;
import indhu.niit.models.Supplier;

@Controller
public class suppliercontroller 
{
	@Autowired
	SupplierDao supplierDao;

	@RequestMapping("/supplier")
	public String showCategory(Model m)
	{
		List<Supplier> listSuppliers=supplierDao.listSuppliers();
		
		m.addAttribute("supplierList", listSuppliers);
		
		return "supplier";
	}
	
	@RequestMapping(value="/InsertSupplier",method=RequestMethod.POST)
	public String saveCategoryDetail(@RequestParam("supName")String supplierName,@RequestParam("supDesc") String supplierDesc,Model m)
	{
		Supplier supplier=new Supplier();
		supplier.setSupplierName(supplierName);
		supplier.setSupplierDesc(supplierDesc);
		supplierDao.addSupplier(supplier);
		
		
		List<Supplier> listSuppliers=supplierDao.listSuppliers();
		m.addAttribute("supplierList", listSuppliers);
		
		return "supplier";
	}
	
	@RequestMapping(value="/deleteSupplier/{supplierId}")
	public String deleteSupplier(@PathVariable("supplierId")int supplierId,Model m)
	{
		Supplier supplier=supplierDao.getSupplier(supplierId);
		supplierDao.deleteSupplier(supplier);
		
		List<Supplier> listSuppliers=supplierDao.listSuppliers();
		m.addAttribute("supplierList", listSuppliers);
		
		return "supplier";
	}
	
	@RequestMapping(value="/editSupplier/{supplierId}")
	public String editSupplier(@PathVariable("supplierId")int supplierId,Model m)
	{
		Supplier supplier=supplierDao.getSupplier(supplierId);
		m.addAttribute(supplier);
		return "updatesupplier";
	}
	
	@RequestMapping(value="/UpdateSupplier",method=RequestMethod.POST)
	 public String updateCategory(Model m,@RequestParam("supId")int supplierID,@RequestParam("supName")String supplierName,@RequestParam("supDesc")String supplierDesc)
	 {
		 Supplier supplier=supplierDao.getSupplier(supplierID);
		 supplier.setSupplierName(supplierName);
		 supplier.setSupplierDesc(supplierDesc);
		 supplierDao.updateSupplier(supplier);
		 List< Supplier> listSuppliers=supplierDao.listSuppliers();
		 m.addAttribute("supplierList",listSuppliers);
		 return "supplier";
	 }
	
	
}
	
	