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

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.domain.Category;

@Controller
public class CategoryController {

	private static Logger log = LoggerFactory.getLogger(CategoryController.class);

	@Autowired
	private CategoryDAO categoryDAO;

	@Autowired
	private Category category;
	
	@RequestMapping(value = "/manage_categories",method = RequestMethod.GET)
	public String listCategories(Model model) {
		log.debug(" Starting of the method listCategories");
		model.addAttribute("category", category);
		model.addAttribute("categoryList", categoryDAO.list());
		model.addAttribute("isAdminClickedCategories", "true");
		log.debug(" End of the method listCategories");
		return "/Admin/Category";
	}
	
	
	

	@RequestMapping(value = "/manage_category_add",method = RequestMethod.GET)
	public String addCategory(@ModelAttribute("category") Category category, Model model) {
		log.debug(" Starting of the method addCategory");
		log.info("id:" + category.getId());
		if (categoryDAO.saveOrUpdate(category) == true) {
			
			model.addAttribute("msg", "Successfully created/updated the category");
		} else {
			model.addAttribute("msg", "not able created/updated the category");
		}
		model.addAttribute("category", category);
		model.addAttribute("categoryList", categoryDAO.list());
		model.addAttribute("isAdminClickedCategories", "true");
		log.debug(" Ending of the method addCategory");
		return "forward:/manage_categories";
	}

	@RequestMapping("manage_category_remove/{id}")
//	public ModelAndView deleteCategory(@PathVariable("id") String id, Model model) throws Exception {
	public String deleteCategory(@PathVariable("id") String id, Model model) throws Exception {
		boolean flag = categoryDAO.delete(id);

		String msg = "Successfully done the operation";
		if (flag != true) {
			msg = "The operation could not success";
		}
		/*
		 * model.addAttribute("category", category);
		 * model.addAttribute("categoryList", this.categoryDAO.list());
		 */
		model.addAttribute("msg", msg);
	//	ModelAndView mv = new ModelAndView("forward:/manage_categories");
		//return mv;

		return "forward:/manage_categories";
	}

	@RequestMapping("manage_category_edit/{id}")
	public String editCategory(@PathVariable("id") String id, Model model)throws Exception {
	Category	cat = categoryDAO.get(id);
	System.out.println(id);

		categoryDAO.saveOrUpdate(cat);
		log.debug(" Starting of the method editCategory");

		//model.addAttribute("category", category);
		log.debug(" End of the method editCategory");
		return "forward:/manage_categories";
	}

}
