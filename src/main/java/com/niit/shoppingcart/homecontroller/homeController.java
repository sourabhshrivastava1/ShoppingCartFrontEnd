package com.niit.shoppingcart.homecontroller;

import java.util.Collection;

import javax.servlet.http.HttpSession;
import java.util.List;
import org.hibernate.annotations.common.util.impl.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.MycartDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.domain.Category;
import com.niit.shoppingcart.domain.Mycart;
import com.niit.shoppingcart.domain.Product;
import com.niit.shoppingcart.domain.Supplier;
import com.niit.shoppingcart.domain.User;

@Controller
public class homeController {
	
	org.jboss.logging.Logger log = LoggerFactory.logger(homeController.class);
	
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
	private MycartDAO mycartDAO;

	@Autowired
	private Mycart mycart;

	
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
		mv.addObject("msg", "  WELCOME TO Login PAGE");
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
		mv.addObject("isUserClickedContactUs","true");
		return mv;
	}
	@RequestMapping("/Menu")
	public ModelAndView showMenuPage()
	{
		ModelAndView mv = new ModelAndView("/index");
		mv.addObject("msg", "  Hello  , WELCOME TO Menu PAGE");
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
	

	
	@RequestMapping("/Mycart")
	public ModelAndView showMycart()
	{
		ModelAndView mv = new ModelAndView("/index");
		mv.addObject("isUserClickedMycart", "true");
		List<Mycart> mycartList=mycartDAO.list();
		mv.addObject("mycartList",mycartList);
		mv.addObject("mycart",mycart);
		return mv;
	}
	

	@RequestMapping("/index")
	public String reDirectToHome(@ModelAttribute("selectedProduct") final Product selectedProduct, final Model model) {
		
		model.addAttribute("selectedProduct", selectedProduct);
	   /* model.addAttribute("categoryList", this.categoryDAO.list());
	    model.addAttribute("productList", this.productDAO.list());*/
		
		return "/index";
	}

	

	@RequestMapping("/CheckoutPage")
	public ModelAndView showCheckoutPage() {

		log.debug("**Starting OF ***************CHECK****OUT PAGE");
		ModelAndView mv = new ModelAndView("/CheckoutPage");
		log.debug("**Ending  OF ***************CHECK****OUT PAGE");
		return mv;
	}

	@RequestMapping(value="/EndTY" ,method = RequestMethod.POST)
	public ModelAndView showlastPage(){
	log.debug("**Starting OF ***************Thanku**** PAGE");
	ModelAndView mv = new ModelAndView("/EndTY");
	log.debug("**Ending  OF ***************Thanku****PAGE");
	return mv;
	}
}
	
	/*{

		log.debug("This is ***************lastPage");
		
		String loggedInUserid = (String) session.getAttribute("loggedInUserID");
		
		log.info("the logged in ********USER ID***********"+ loggedInUserid );
		
		if (loggedInUserid == null) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			loggedInUserid = auth.getName();
			Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>)   auth.getAuthorities();
			authorities.contains("ROLE_USER");
			
		}
		
		log.info("the logged in ********USER ID***********"+ loggedInUserid );
		
		java.util.List<Mycart> mycartlist = mycartDAO.list(loggedInUserid);
		
		int mycartsize = mycartDAO.list(loggedInUserid).size();
		
		log.info("the ****SIZE IS******"+mycartsize);
	
		for(Mycart listall : mycartlist)
		{
			
			mycart.setId(listall.getId());;
			
			mycartDAO.delete(mycart);
			
			log.info("****THE CATSIZE**** "+mycartsize);
		}
		
		ModelAndView mv = new ModelAndView("EndTY");
		
		log.debug("This is end ************of lastpage");
		return mv;
	}
*/



	

