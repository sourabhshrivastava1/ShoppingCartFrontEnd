package com.niit.shoppingcart.homecontroller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.domain.Category;
import com.niit.shoppingcart.domain.Product;
import com.niit.shoppingcart.domain.Supplier;
import com.niit.shoppingcart.domain.User;

@Controller
public class homeController {
	

	
	@Autowired
	User user;

	@Autowired
	private CategoryDAO categoryDAO;

	@Autowired
	private Category category;

	@Autowired
	private SupplierDAO supplierDAO;

	@Autowired
	private Supplier supplier;

	@Autowired
	private Product product;
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private HttpSession session;

	/**
	 * Category list will load and set to session
	 * 
	 * @param session
	 * @return
	 */
	
	/*@RequestMapping("/")
	public ModelAndView showHomePage()
	{
		
		//Specifying which page you have navigateion
		ModelAndView mv = new ModelAndView("/index");
		
		//Specify what data you have to carry to home page
		
		mv.addObject("msg", "WELCOME TO SHOPPING CART");
		
		return mv;
	}*/
	@RequestMapping("/")
	public ModelAndView onLoad() {
		
		ModelAndView mv = new ModelAndView("/index");
		session.setAttribute("category", category); // domain object names
		session.setAttribute("product", product);
		session.setAttribute("supplier", supplier);
		
		
		session.setAttribute("categoryList", categoryDAO.list());
		
		session.setAttribute("supplierList", supplierDAO.list());
		
		session.setAttribute("productList", productDAO.list());
	



		
		return mv;
	}
	/*@RequestMapping("/Login")
	public ModelAndView loginHere() {
	
		System.out.println("loginHere");
		ModelAndView mv = new ModelAndView("/index");
		mv.addObject("user", user);
		mv.addObject("isUserClickedLogin", "true");
		
		return mv;
	}
	@RequestMapping("/Registration")
	public ModelAndView registerHere() {
	
		ModelAndView mv = new ModelAndView("/index");
		mv.addObject("user", user);
		mv.addObject("isUserClickedRegister", "true");
		
		return mv;
	}*/
	@RequestMapping("/Login")
	public ModelAndView showLoginPage()
	{
		ModelAndView mv = new ModelAndView("/index");
		mv.addObject("msg", "  WELCOME TO HOME PAGE");
		mv.addObject("isUserClickedLogin","true");
		mv.addObject("user", user);
		return mv;
	}

	@RequestMapping("/Registration")
	public ModelAndView showRegistrationPage()
	{
		ModelAndView mv = new ModelAndView("/index");
		mv.addObject("msg", "  WELCOME TO Registration page ");
		mv.addObject("isUserClickedRegistration","true");
		mv.addObject("user",user);
		return mv;
	}
	
	@RequestMapping("/Contact")
	public ModelAndView showContactPage()
	{
		ModelAndView mv = new ModelAndView("/Contact");
		mv.addObject("msg", " Hey Hello Brother , WELCOME TO Contact PAGE");
		mv.addObject("isUserClickedContact","true");
		return mv;
	}
	@RequestMapping("/Menu")
	public ModelAndView showMenuPage()
	{
		ModelAndView mv = new ModelAndView("/index");
		mv.addObject("msg", " Hey Hello Brother , WELCOME TO Menu PAGE");
		mv.addObject("isUserClickedMenu","true");
		return mv;
	}

	@RequestMapping("/AboutUs")
	public ModelAndView showAboutUSPage()
	{
		ModelAndView mv = new ModelAndView("/AboutUs");
		mv.addObject("msg", " Hello , WELCOME TO About-US PAGE");
		mv.addObject("isUserClickedAboutUS","true");
		return mv;
	}
	
/*	@RequestMapping("/validate")
	public ModelAndView validateCredentials(@RequestParam("userID") String id,@RequestParam("password") String pwd)
	{

		
		//Actually you have get the data from DB
		//Tempororily  -user->niit password =niit@123
		
		ModelAndView mv = new ModelAndView("/index");
		mv.addObject("isUserLoggedIn", "false");
		if( userDAO.validate(id, pwd)==true)
			
		{
			//Createntials are correct
			mv.addObject("isUserLoggedIn", "true");
			
			user = userDAO.getUser(id);
			
			if(user.getRole().equals("Role_Admin"))
			{   
				mv.addObject("isAdmin", "true");
				mv.addObject("role", "Admin");
			}
			else
			{
				mv.addObject("isAdmin", "false");
				mv.addObject("role", "User");
			}
			
			mv.addObject("successMessage", "Valid Credentials");
			session.setAttribute("loginMessage", "Welcome :" +id);
		}
		else
		{
			mv.addObject("errorMessage", "InValid Credentials...please try again");
		}
		
		return mv;
		
		
	}*/

/*	@RequestMapping("/validate")
	public ModelAndView validateCredentials(@RequestParam("userID") String id, 
			@RequestParam("password") String pwd)
	{
		
		
		//Actually you have get the data from DB
		//Tempororily  -user->niit password =niit@123
		
		ModelAndView mv = new ModelAndView("/index");
		
		if(id.equals("niit")   && pwd.equals("niit@123"))
		{
			mv.addObject("successMessage", "Valid Credentials");
			session.setAttribute("loginMessage", "Welcome :" +id);
		}
		else
		{
			mv.addObject("errorMessage", "InValid Credentials...please try again");
		}
		
		return mv;
		
	}*/
/*	@RequestMapping("/logout")
	public ModelAndView showlogout()
	{
		ModelAndView mv = new ModelAndView("/index");
		session.removeAttribute("loginMessage");
		return mv;
				
	}*/
	
	@RequestMapping("/Mycart")
	public ModelAndView showMycart()
	{
		ModelAndView mv = new ModelAndView("/index");
		mv.addObject("isUserClickedMycart", "true");
		return mv;
	}
	

	@RequestMapping("/index")
	public String reDirectToHome(@ModelAttribute("selectedProduct") final Product selectedProduct, final Model model) {
		
		model.addAttribute("selectedProduct", selectedProduct);
	   /* model.addAttribute("categoryList", this.categoryDAO.list());
	    model.addAttribute("productList", this.productDAO.list());*/
		
		return "/index";
	}
}
	/*@RequestMapping(value = "/doUpload", method = RequestMethod.POST)
	public String handleFileUpload(HttpServletRequest request,
	        @RequestParam CommonsMultipartFile[] fileUpload) throws Exception {
	      
	    if (fileUpload != null && fileUpload.length > 0) {
	        for (CommonsMultipartFile aFile : fileUpload){
	              
	            System.out.println("Saving file: " + aFile.getOriginalFilename());
	             
	            Product product = new Product();
	            product.setName(aFile.getOriginalFilename());
	            product.setDescription(aFile.getBytes());;
	          
	            productDAO.save(product);               
	        }
	    }

	    return "Success";
	} */ 


	

