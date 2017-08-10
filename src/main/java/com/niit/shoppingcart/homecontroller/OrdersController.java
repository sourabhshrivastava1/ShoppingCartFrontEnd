package com.niit.shoppingcart.homecontroller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.MycartDAO;
import com.niit.shoppingcart.dao.OrdersDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.dao.UserDAO;
import com.niit.shoppingcart.domain.Category;
import com.niit.shoppingcart.domain.Mycart;
import com.niit.shoppingcart.domain.Orders;
import com.niit.shoppingcart.domain.Product;
import com.niit.shoppingcart.domain.Supplier;
import com.niit.shoppingcart.domain.User;

@Controller
public class OrdersController {
	
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
	private OrdersDAO ordersDAO;
	

	@Autowired
	private Orders orders;

	
	@Autowired
	private HttpSession session;


	
	@RequestMapping(value = "/CheckoutPage" , method=RequestMethod.GET)
	public ModelAndView CheckoutPage(@ModelAttribute Orders orders, @ModelAttribute("User_id")String User_id,  
			@ModelAttribute("House_no")String house_no,@ModelAttribute("Street")String street,@ModelAttribute("City")String City,@ModelAttribute("pincode")String pincode,
@ModelAttribute("State")String state,@ModelAttribute("Country")String country,@ModelAttribute("Card_type")String card_type,@ModelAttribute("Card_no")String card_no,@ModelAttribute("Card_cvv")String card_cvv,
@ModelAttribute("Expirydate")String expirydate)
{
		// @ModelAttribute("id")long id,@ModelAttribute("User_id")String User_id,
		
		orders.setUser_id(User_id);
		orders.setHouse_no(house_no);
		orders.setStreet(street);
	    orders.setCity(City);
	    orders.setPincode(pincode);
	    orders.setState(state);
	    orders.setCountry(country);
	    orders.setCard_type(card_type);
	    orders.setCard_no(card_no);
	    orders.setCard_cvv(card_cvv);
	    orders.setExpirydate(expirydate);
	    
	      
	      ModelAndView mv = new ModelAndView("/CheckoutPage");
	   
	      if(ordersDAO.save(orders))
	      {
	    	  mv.addObject("success", "Order Confirmed");
	      }
	      else
	      {
	    	  mv.addObject("error" ,"you are not Able  to place order ");
	      }
	      return mv;
	
	}
	
}