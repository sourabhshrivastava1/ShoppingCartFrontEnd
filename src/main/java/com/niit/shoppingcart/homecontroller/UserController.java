     package com.niit.shoppingcart.homecontroller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.MycartDAO;
import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.dao.UserDAO;
import com.niit.shoppingcart.domain.Category;
import com.niit.shoppingcart.domain.Mycart;
import com.niit.shoppingcart.domain.Product;
import com.niit.shoppingcart.domain.Supplier;
import com.niit.shoppingcart.domain.User;

@Controller
public class UserController {

	public static Logger log = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserDAO userDAO;
	

	@Autowired
	private User user;

	@Autowired
	private MycartDAO cartDAO;

	@Autowired
	private Mycart myCart;

	@Autowired
	private CategoryDAO categoryDAO;

	@Autowired
	private Category category;

	@Autowired
	private SupplierDAO supplierDAO;

	@Autowired
	private Supplier supplier;
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private Product product;

	
	@Autowired
	private HttpSession session;

	/**
	 * if invalid credentials -> Home page , login , error message if valid
	 * credentials && he is admin -> AdminHome page ,logout link if valid
	 * credentials && he is end user -> Home page, myCart, logout link
	 * 
	 * @param userID
	 * @param password
	 * @return it will return data and page name where to return
	 */
	/*@RequestMapping(value = "/validate", method = RequestMethod.POST)
	public ModelAndView validate(@RequestParam(value = "userID") String userID,
			@RequestParam(value = "password") String password) {
		log.debug("Starting of the method validate");

		// ModelAndView mv = new ModelAndView("/home");
		ModelAndView mv = new ModelAndView("/index");
		user = userDAO.getUser(userID);  //you no need to do this step 
											//if you are using spring security
		// if the record exist with this userID and password it will return user
		// details else will return null

		if (user != null) {
			log.debug("Valid Credentials");
			
			session.setAttribute("loggedInUser", user.getName());
			session.setAttribute("loggedInUserID", user.getId());

			session.setAttribute("user", user); //
			session.setAttribute("supplier", supplier);
			session.setAttribute("supplierList", supplierDAO.list());
			
			session.setAttribute("productList", productDAO.list());
			session.setAttribute("product", product);

			session.setAttribute("category", category);
			session.setAttribute("categoryList", categoryDAO.list());

			if (user.getRole().equals("Role_Admin")) {
				log.debug("Logged in as Admin");
				mv.addObject("isAdmin", "true");
				

			} else {
				log.debug("Logged in as User");
				mv.addObject("isAdmin", "false");
				mv.addObject("role", "ROLE_USER");
				//myCart = cartDAO.list(userID);
				mv.addObject("myCart", myCart);
				// Fetch the myCart list based on user ID
				List<MyCart> cartList = cartDAO.list(userID);
				mv.addObject("cartList", cartList);
				mv.addObject("cartSize", cartList.size());
			}

		} else {
			log.debug("Invalid Credentials");

			mv.addObject("invalidCredentials", "true");
			mv.addObject("errorMessage", "Invalid Credentials");
			
			// ${errorMessage}

		}
		log.debug("Ending of the method validate");
		return mv;
	}*/
	
	@RequestMapping("/logout")
	public ModelAndView logout() {
		log.debug("Starting of the method logout");
		ModelAndView mv = new ModelAndView("/index");
		session.invalidate(); // will remove the attributes which are added
								// session
		session.setAttribute("category", category);
		session.setAttribute("categoryList", categoryDAO.list());
        session.removeAttribute("loginmessage");
		mv.addObject("logoutMessage", "You successfully logged out");
		mv.addObject("loggedOut", "true");
		
	    log.debug("Ending of the method logout");
		return mv;
	}
	@RequestMapping(value = "/Registration" , method=RequestMethod.POST)
	public ModelAndView registerPage(@ModelAttribute User user,    @ModelAttribute("id")String id,@ModelAttribute("name")String name,
			@ModelAttribute("password")String password,@ModelAttribute("Email")String Email,@ModelAttribute("contact")String contact)
	{
		
	      user.setId(id);
	      user.setEmail(Email);
	      user.setName(name);
	      user.setPassword(password);
	      user.setContact(contact);
	      user.setRole("ROLE_USER");
	      
	      ModelAndView mv = new ModelAndView("/index");
	      if(userDAO.save(user))
	      {
	    	  mv.addObject("success", "Success To Registration");
	      }
	      else
	      {
	    	  mv.addObject("error" ,"you are not Register go to Page Contact or About us ");
	      }
	      return mv;
	
	}

}

