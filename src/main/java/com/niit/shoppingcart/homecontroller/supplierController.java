package com.niit.shoppingcart.homecontroller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.domain.Supplier;

@Controller
public class supplierController {

	private static Logger log = LoggerFactory.getLogger(supplierController.class);

	@Autowired
	private SupplierDAO supplierDAO;

	@Autowired
	private Supplier supplier;
	
	@RequestMapping(value = "/manage_supplier",method = RequestMethod.GET)
	public String listCategories(Model model) {
		log.debug(" Starting of the method listSupplier");
		model.addAttribute("supplier", supplier);
		model.addAttribute("supplierList", supplierDAO.list());
		model.addAttribute("isAdminClickedSupplier", "true");
		log.debug(" End of the method listSupplier");
		return "/Admin/Supplier";
	}
	
	
	

	@RequestMapping(value = "/manage_supplier_add", method = RequestMethod.POST)
	public String addSupplier(@ModelAttribute("supplier") Supplier supplier, Model model) {
		log.debug(" Starting of the method addSupplier");
		log.info("id:" + supplier.getId());
		if (supplierDAO.save(supplier) == true) {
			
			model.addAttribute("msg", "Successfully created/updated the supplier");
		} else {
			model.addAttribute("msg", "not able created/updated the supplier");
		}
		model.addAttribute("supplier", supplier);
		model.addAttribute("supplierList", supplierDAO.list());
		model.addAttribute("isAdminClickedSupplier", "true");
		log.debug(" Ending of the method addSupplier");
		return "forward:/manage_supplier";
	}

	@RequestMapping("manage_supplier_remove/{id}")
//	public ModelAndView deleteSupplier(@PathVariable("id") String id, Model model) throws Exception {
	public String deleteSupplier(@PathVariable("id") String id, Model model) throws Exception {
		boolean flag = supplierDAO.delete(id);

		String msg = "Successfully done the operation";
		if (flag != true) {
			msg = "The operation could not success";
		}
		/*
		 * model.addAttribute("supplier", supplier);
		 * model.addAttribute("supplierList", this.supplierDAO.list());
		 */
		model.addAttribute("msg", msg);
	//	ModelAndView mv = new ModelAndView("forward:/manage_categories");
		//return mv;

		return "forward:/manage_supplier";
	}

	@RequestMapping("manage_supplier_edit/{id}")
	public String editSupplier(@PathVariable("id") String id, Model model) {
		// supplierDAO.saveOrUpdate(supplier);
		log.debug(" Starting of the method editSupplier");

		supplier = supplierDAO.get(id);
		//model.addAttribute("supplier", supplier);
		log.debug(" End of the method editSupplier");
		return "forward:/manage_supplier";
	}

}
