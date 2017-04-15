package com.niit.shoppingcart.homecontroller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.domain.Product;

@Controller
public class ProductController {

	private static Logger log = LoggerFactory.getLogger(ProductController.class);

	@Autowired
	private ProductDAO productDAO;

	@Autowired
	private Product product;
	
	@RequestMapping(value = "/manage_product",method = RequestMethod.GET)
	public String listProducts(Model model) {
		log.debug(" Starting of the method listProduct");
		model.addAttribute("product", product);
		model.addAttribute("ProductList", productDAO.list());
		model.addAttribute("isAdminClickedProduct", "true");
		log.debug(" End of the method listProduct");
		return "/Admin/Product";
	}
	
	
	

	@RequestMapping(value = "/manage_products_add", method = RequestMethod.POST)
	public String addProduct(@ModelAttribute("product") Product product, @RequestParam CommonsMultipartFile[] fileUpload,Model model,HttpServletRequest request) {
		{
			if(fileUpload !=null && fileUpload.length > 0){
				for(CommonsMultipartFile aFile : fileUpload){
					System.out.println("SavingFile: "+ aFile.getOriginalFilename());
					
					product.setImage(product.getName() +product.getPrice()+".jpeg");
					product.setDescription(aFile.getBytes());
				}
			}
		}
		
		log.debug(" Starting of the method addProduct");
		log.info("id:" + product.getId());
		if (productDAO.saveOrUpdate(product) == true) {
			
			model.addAttribute("msg", "Successfully created/updated the product");
		} else {
			model.addAttribute("msg", "not able created/updated the product");
		}
		model.addAttribute("product", product);
		model.addAttribute("ProductList", productDAO.list());
		model.addAttribute("isAdminClickedProduct", "true");
		log.debug(" Ending of the method addProduct");
		return "/product";
	}

	@RequestMapping("manage_products_remove/{id}")
//	public ModelAndView deleteProduct(@PathVariable("id") String id, Model model) throws Exception {
	public String deleteProduct(@PathVariable("id") String id, Model model) throws Exception {
		boolean flag = productDAO.delete(id);

		String msg = "Successfully done the operation";
		if (flag != true) {
			msg = "The operation could not success";
		}
		/*
		 * model.addAttribute("product", product);
		 * model.addAttribute("categoryList", this.productDAO.list());
		 */
		model.addAttribute("msg", msg);
	//	ModelAndView mv = new ModelAndView("forward:/manage_categories");
		//return mv;

		return "forward:/manage_products";
	}

	@RequestMapping("manage_product_edit/{id}")
	public String editProduct(@PathVariable("id") String id, Model model) {
		// productDAO.saveOrUpdate(product);
		log.debug(" Starting of the method editProduct");

		product = productDAO.get(id);
		//model.addAttribute("product", product);
		log.debug(" End of the method editProduct");
		return "forward:/manage_products";
	}

	
}
