package project.ims.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import project.ims.dao.*;
import project.ims.entity.Address;
import project.ims.entity.Customer;
import project.ims.entity.Login;
import project.ims.entity.UserDetails;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

/**
 * Created by hello on 7/11/2016.
 @ */
@Controller
public class CustomerController {

	@Autowired
	OrderDAO orderDAO;

	@Autowired
	OrderDetailsDAO ODDAO;

	@Autowired
	CartDAO cartDAO;

	@Autowired
	UserDAO userdao;

	@Autowired
	AddressDAO addressdao;

	@Autowired
	CustomerDAO cdao;

	@Autowired
	LoginDAO ldao;

	@RequestMapping(value="/registercustomer" , method= RequestMethod.GET)
	public String showForm(Model model){
		model.addAttribute("command",new UserDetails());
		model.addAttribute("login1", new Login());
		model.addAttribute("address1", new Address());
		return "customerwebpage/customer/registercustomer";
	}


	@RequestMapping(value="/registeredcustomerview" , method= RequestMethod.POST)
	public String showResult(@Valid @ModelAttribute("userdetails1") UserDetails userdetails, BindingResult result2,
							 @ModelAttribute("address1") Address address , BindingResult result1,
							 @ModelAttribute ("login1") Login login, BindingResult result, Model model , HttpSession session){
		System.out.println("you have reached here");

		if (result.hasErrors()|| result1.hasErrors()|| result2.hasErrors()) {
			return "customerwebpage/customer/registercustomer";
		}
		userdetails.setUserType("customer");

		userdao.insert(userdetails);

		addressdao.insert(address);

		login.setUserStatus(true);
		login.setRegisterDate(new java.sql.Time(System.currentTimeMillis()));
		ldao.insert(login);

		Customer customer=new Customer();
		customer.setLoginId(login);
		customer.setUserdetailsId(userdetails);
		customer.setAddressId(address);
		cdao.insert(customer);
		model.addAttribute("customer1", customer);
		session.setAttribute("loggedIn", login);
		return "redirect:/index";
	}

	@RequestMapping (value="/customeredit/{id}", method=RequestMethod.GET)
	public String showEditCustomer(@PathVariable("id") int id, Model model) {
		model.addAttribute("command", new UserDetails());
		model.addAttribute("address1",cdao.getByID(id).getAddressId());
		model.addAttribute("login1", cdao.getByID(id).getLoginId());
		model.addAttribute("user1",cdao.getByID(id).getUserdetailsId());
		model.addAttribute("customer1", cdao.getByID(id));
		return "customerwebpage/customer/customeredit";
	}


	@RequestMapping(value="/customerview/{id}" , method= RequestMethod.POST)
	public String showEditedResult(@Valid @PathVariable("id") int id, @ModelAttribute("user1") UserDetails userdetails,BindingResult result,
								   @ModelAttribute("address1") Address address ,BindingResult result1,
								   @ModelAttribute ("login1") Login login, BindingResult result2,
								   Model model){

		System.out.println("you have reached edited customer view");

		userdetails.setUserdetailsId(cdao.getByID(id).getUserdetailsId().getUserdetailsId());

		login.setLoginId(cdao.getByID(id).getLoginId().getLoginId());
		login.setUserStatus(true);
		login.setRegisterDate(cdao.getByID(id).getLoginId().getRegisterDate());

		address.setAddressId(cdao.getByID(id).getAddressId().getAddressId());

//        if (result.hasErrors() || result1.hasErrors()|| result2.hasErrors()) {
//              model.addAttribute("command", new UserDetails());
//              model.addAttribute("address1",cdao.getByID(id).getAddressId());
//              model.addAttribute("login1", cdao.getByID(id).getLoginId());
//              model.addAttribute("user1",cdao.getByID(id).getUserdetailsId());
//              model.addAttribute("customer1", cdao.getByID(id));
//              return "customer/customeredit";
//            System.out.println("there are binding errors");
//        }

		userdetails.setUserType("customer");
		userdao.update(userdetails);

		addressdao.update(address);

		ldao.update(login);

//        model.addAttribute("customer1",cdao.getByID(id));
//        System.out.println("................ "+cdao.getByID(id).getCustomerId());
		return "redirect:/customerprofile";

	}

	@RequestMapping (value="/customerdel/{id}", method=RequestMethod.GET)
	public String showRegisterCustomerDel(@PathVariable("id") int id, Model model, HttpSession session){
		//delete codes here!!
		System.out.println("the deleted customer id is " + id);
		List<Customer> cus = cdao.getById(id);

		for (Customer customer : cus){
			Address address = customer.getAddressId();
			UserDetails userdetails = customer.getUserdetailsId();
			Login login= customer.getLoginId();
			System.out.println("address id " +address.getAddressId());
			System.out.println("user id " +userdetails.getUserdetailsId());
			System.out.println("login id:"+login.getLoginId());


			addressdao.delete(address.getAddressId());
			userdao.delete(userdetails.getUserdetailsId());
			ldao.delete(login.getLoginId());
		}
		session.removeAttribute("loggedIn");
		return "redirect:/index";

	}

	@RequestMapping (value="/customeradminview" , method=RequestMethod.GET)
	public String showAllCustomer(Model model){
		model.addAttribute("command",cdao.getAll());
		model.addAttribute("customer",cdao.getAll());

		return "customer/customeradminview";
	}


	@RequestMapping (value="/customeradminedit/{id}" , method=RequestMethod.GET)
	public String showeditAllCustomer(@PathVariable("id") int id,Model model){
		model.addAttribute("command", cdao.getByID(id).getUserdetailsId());
		model.addAttribute("customer1",cdao.getByID(id));

		return "customer/customeradminedit";
	}

	@RequestMapping (value="/customeradminedit/customeradminedit1/{id}" , method=RequestMethod.GET)
	public String editActiveCustomer(@PathVariable("id") int id,Model model){
		Login login=cdao.getByID(id).getLoginId();
		System.out.println("login id:"+login.getLoginId());
		login.setUserStatus(true);
		ldao.update(login);

		model.addAttribute("command",cdao.getAll());
		model.addAttribute("customer",cdao.getAll());
		return "redirect:/customeradminview";
	}

	@RequestMapping (value="/customeradminedit/customeradminedit0/{id}" , method=RequestMethod.GET)
	public String editBlockCustomer(@PathVariable("id") int id,Model model){
		Login login=cdao.getByID(id).getLoginId();

		login.setUserStatus(false);
		ldao.update(login);


		model.addAttribute("command",cdao.getAll());
		model.addAttribute("customer",cdao.getAll());
		return "redirect:/customeradminview";
	}

	@RequestMapping (value="/customerprofile", method=RequestMethod.GET)
	public String viewCustomerProfile(HttpSession session, Model model){
		Login login= (Login) session.getAttribute("loggedIn");
		System.out.println(session.getAttribute("loggedIn"));
		System.out.println(login.getLoginId());
		model.addAttribute("customer1", cdao.getCustomer(login.getLoginId()));
		Customer customer=cdao.getCustomer(login.getLoginId());
		model.addAttribute("allorderdetails",ODDAO.getById(customer.getCustomerId()));
		model.addAttribute("allorder", orderDAO.getAll());
		model.addAttribute("allcart",cartDAO.getAll());
		return "customerwebpage/customer/customerview";

	}
}
