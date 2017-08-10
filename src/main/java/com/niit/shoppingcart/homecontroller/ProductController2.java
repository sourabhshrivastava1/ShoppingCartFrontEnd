package com.niit.shoppingcart.homecontroller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.junit.validator.PublicClassValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.domain.Category;
import com.niit.shoppingcart.domain.Product;
import com.niit.shoppingcart.domain.Supplier;
import com.niit.shoppingcart.util.FileUtil;
import com.niit.shoppingcart.util.Util;
import com.niit.shoppingcart.validator.ProductValidator;

@Controller
public class ProductController2 {

	private static Logger log = LoggerFactory.getLogger(ProductController2.class);
	private final Logger logger = LoggerFactory.getLogger(ProductController2.class);
	@Autowired
	private ProductDAO productDAO;

	@Autowired
	private Product product;
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	
	@Autowired
	private Category category;
	

	@Autowired
	private SupplierDAO supplierDAO;
	
	
	@Autowired
	private Supplier supplier;
	@Autowired
	private HttpSession session;

	
	 private String path   ="C://Users//mr10//divya//ShoppingcartFrontend//src//main//webapp//resources//images";
		

	
 	@RequestMapping(value = "/manage_products", method = RequestMethod.GET)
	public String listProducts(Model model) {
		log.debug("Starting of the method listProducts");
		model.addAttribute("product", new Product());
		/*model.addAttribute("category", new Category());
		model.addAttribute("supplier", new Supplier());*/
		model.addAttribute("productList", this.productDAO.list());
		/*model.addAttribute("categoryList", this.categoryDAO.list());
		model.addAttribute("supplierList", this.supplierDAO.list());*/
		model.addAttribute("isAdminClickedProducts", "true");
		log.debug("Ending of the method listProducts");
		return "/Admin/Product";
	}

	// For add and update product both
	@RequestMapping(value = "/manage_product_add", method = RequestMethod.POST)
	public String addProduct(@ModelAttribute("product") Product product,
			 @RequestParam("file") MultipartFile file, Model model) {
	
		
		log.debug("Starting of the method addProduct");
		Category category = categoryDAO.getCategoryByName(product.getCategory().getName());
		// categoryDAO.saveOrUpdate(category); // why to save??

		Supplier supplier = supplierDAO.getSupplierByName(product.getSupplier().getName());
		// supplierDAO.saveOrUpdate(supplier); // Why to save??

		product.setCategory(category);
		product.setSupplier(supplier);

		product.setCategory_id(category.getId());
		product.setSupplier_id(supplier.getId());
		//product.setID(Util.removeComman(product.getID()));
		productDAO.save(product);

		FileUtil.upload(path, file, product.getName() + ".jpg");
		log.debug("Ending of the method addProduct");
		model.addAttribute("isAdminClickedProducts", "true");
		model.addAttribute("productList", this.productDAO.list());
		model.addAttribute("product", new Product());
		model.addAttribute("categoryList", this.categoryDAO.list());
		model.addAttribute("category", new Category());
		
		return "/Admin/AdminHome";
		// return "redirect:/uploadFile";

	}


	
	@RequestMapping("manage_product_remove/{id}")
//	public ModelAndView deleteProduct(@PathVariable("id") String id, Model model) throws Exception {
	public String deleteProduct(@PathVariable("id") long id, Model model) throws Exception {
		boolean flag = productDAO.delete(id);

		String msg = "Successfully done the operation";
		if (flag != true) {
			msg = "The operation could not success";
		}
		
		 model.addAttribute("product", product);
		  model.addAttribute("categoryList", this.productDAO.list());
		 
		model.addAttribute("msg", msg);
	//	ModelAndView mv = new ModelAndView("forward:/manage_categories");
		//return mv;

		return "forward:/manage_products";
	}
	

	@RequestMapping("manage_product_edit/{name}")
	public String editProduct(@PathVariable("name") String name, Model model) {
		// productDAO.saveOrUpdate(product);
		log.debug(" Starting of the method editProduct");

		product = productDAO.get(name);
		//model.addAttribute("product", product);
		log.debug(" End of the method editProduct");
		return "forward:/manage_products";
	}
	@RequestMapping("details_get/{name}")
	public ModelAndView viewdetails(@PathVariable("name") String name){
		
		log.debug(" Starting of the method deatils product");
		ModelAndView mv =  new ModelAndView("redirect:/");
		session.setAttribute("isProductClicked","true");
		mv.addObject("product",  productDAO.getProductByName("name"));
		mv.addObject("sucessMessage", "This is Product List");
		
		log.debug(" End of the method details product");
		return mv;
		
	}

	@RequestMapping("manage_product/get/{name}")
public ModelAndView viewdetail(@PathVariable("name") String name){
		
		log.debug(" Starting of the method deatils product");
		ModelAndView mv =  new ModelAndView("redirect:/");
		session.setAttribute("isProductClicked","true");
		mv.addObject("product",  productDAO.getProductByName("name"));
		mv.addObject("sucessMessage", "This is Product List");
		
		log.debug(" End of the method details product");
		return mv;
	}

}

