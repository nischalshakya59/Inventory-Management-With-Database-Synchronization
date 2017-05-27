package project.ims.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import project.ims.dao.*;
import project.ims.entity.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    ProductDAO productDAO;

    @Autowired
    BrandDAO brandDAO;

    @Autowired
    CategoryDAO categoryDAO;

    @Autowired
    SupplierDAO supplierDAO;


    @Autowired
    OrderDAO orderDAO;

    @Autowired
    OrderDetailsDAO ODDAO;

    @Autowired
    CartDAO cartDAO;

    @Autowired
    CustomerDAO cdao;

    @Autowired
    LoginDAO loginDAO;

    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public String dashboard(Model model, HttpSession session){

        Login login= (Login) session.getAttribute("adminloggedIn");
        if(login == null){
            return "redirect:/admin/adminloginbox";
        }
        model.addAttribute("supplierinfo", supplierDAO.getAll());
        model.addAttribute("productinfo", productDAO.getAll());
        model.addAttribute("brandinfo", brandDAO.getAll());
        model.addAttribute("command", new Cart());

        int productCount = 0;
        for(Product pro: productDAO.getAll() ){
            productCount = productCount+1;
        }

        model.addAttribute("productCount", productCount);

        int brandCount = 0;
        for(Brand brand: brandDAO.getAll()){
            brandCount = brandCount +1;
        }
        model.addAttribute("brandCount", brandCount);

        int categoryCount = 0;
        for(Category category: categoryDAO.getAll()){
            categoryCount = categoryCount +1;
        }
        model.addAttribute("categoryCount", categoryCount);

        int supplierCount = 0;
        for(Supplier supplier: supplierDAO.getAll()){
            supplierCount = supplierCount +1;
        }
        model.addAttribute("supplierCount", supplierCount);
        model.addAttribute("notifycount",ODDAO.getNotificationCount());
        return "/admin/dashboard";

    }

    @RequestMapping(value = "/details/{id}", method = RequestMethod.GET)
    public String salesProductDetails(@PathVariable("id") int id, Model model) {

        model.addAttribute("command", new Product());
        for (Product pro : productDAO.getById(id)) {
            model.addAttribute("productinfo", pro);
            model.addAttribute("brand", brandDAO.getByID(productDAO.getByID(id).getBrandId()));
            model.addAttribute("supplier", supplierDAO.getByID(productDAO.getByID(id).getSupplierId()));
            model.addAttribute("quantity", pro.getProductQuantity());
            model.addAttribute("cart", new Cart());

        }
        return "/admin/salesproductdetails";
    }

    @RequestMapping(value = "/addcart/{id}")
    public String addToCart(@Valid @PathVariable  ("id") int id,
                            @ModelAttribute("cart")Cart cart,
                            BindingResult result, HttpSession session,
                            @RequestParam("quantity") int qty,
                            @RequestHeader ("referer") String referredFrom, Model model){


        cart.setQuantity(qty);
        cart.setProductId(productDAO.getByID(id));
        cart.setRate((cart.getProductId().getProductPrice()));

        int total=0;
        total=(cart.getQuantity()*cart.getRate());
        cart.setTotalAmount(Double.parseDouble(String.valueOf(total)));

        List<Cart> cartList = (List<Cart>) session.getAttribute("cart");

        if(cartList == null){
            cartList = new ArrayList<>();
            cartList.add(cart);
        }else {
            for(Cart crt: cartList){
                if(crt.getProductId().getProductId()==id){
                    crt.setQuantity(crt.getQuantity()+qty);
                    total = (crt.getQuantity()*cart.getRate());
                    crt.setTotalAmount(Double.parseDouble(String.valueOf(total)));
                    return "redirect:" + referredFrom;
                }
            }

            cartList.add(cart);
        }

        session.setAttribute("cart", cartList);
        return "redirect:"+ referredFrom;
    }

    @RequestMapping(value = "/delete/{id}")
    public String removeCart(@PathVariable ("id") int id, HttpSession session,
                             @RequestHeader ("referer") String referredFrom){
        List<Cart> cartList = (List<Cart>) session.getAttribute("cart");

        for(Iterator<Cart> iterator = cartList.iterator(); iterator.hasNext();){
            Cart cart = iterator.next();
            if(cart.getProductId().getProductId()==id){
                iterator.remove();
                return "redirect:"+referredFrom;
            }
        }
        return "redirect:"+referredFrom;
    }

    @RequestMapping(value = "/shoppingcart")
    public String viewCart(HttpSession session, Model model){
        List<Cart> cartList = (List<Cart>) session.getAttribute("cart");
        if(cartList==null){
            model.addAttribute("total", 0.0);
            model.addAttribute("discount",0.0);
            model.addAttribute("grand",0.0 );
            return "";
        }

        model.addAttribute("allcart", cartList);
        Double total = cartDAO.calculateTotal(cartList);
        Double discount=total *0.05;
        model.addAttribute("total",total );
        model.addAttribute("discount",discount);
        model.addAttribute("grand",(total-discount) );
        return "/admin/shoppingcart";
    }

    @RequestMapping(value="/ordernotification")
    public String orderNotification(Model model){
        model.addAttribute("allorder",orderDAO.getAll());
        model.addAttribute("allorderD",ODDAO.getSpecific());
        model.addAttribute("allcart",cartDAO.getAll());
        return "/admin/ordernotification";
    }

    @RequestMapping(value = "/order/view")
    public String orderview(Model model){
        model.addAttribute("allorder",orderDAO.getAll());
        model.addAttribute("allorderD",ODDAO.getSpecific());
        model.addAttribute("allcart",cartDAO.getAll());
        return "/admin/orderview";
    }

    @RequestMapping(value = "/odetails/{id}")
    public String orderdetails( Model model
                            ,@PathVariable("id")int id
    ){
        model.addAttribute("customerinfo", cdao.getByID(id).getUserdetailsId());
        model.addAttribute("customer",cdao.getByID(id));

        model.addAttribute("allorderdetails",ODDAO.getById(id));
        model.addAttribute("allorder", orderDAO.getAll());
        model.addAttribute("allcart",cartDAO.getAll());



        return "admin/orderdetails";
    }

    @RequestMapping (value="/delivered/{id}")
    public String delivered(@PathVariable  ("id") int id,@RequestHeader ("referer") String referredFrom){
        OrderDetails od=ODDAO.getByID(id);
        od.setOrderStatus(true);
        ODDAO.update(od);
        System.out.println("----------------------------------DELIVERED---------------------------------");
        return "redirect:"+referredFrom;
    }


    @RequestMapping(value="/adminloginbox" , method= RequestMethod.GET)
    public String viewLoginForm (Model model ){
        model.addAttribute("command", new Login());
        return "admin/adminloginbox";
    }

    @RequestMapping(value="/adminlogin" , method=RequestMethod.POST)
//    @ResponseBody
    public String getStartedClicked (@RequestParam ("username") String username ,
                                     @RequestParam ("password") String password , Model model, HttpSession session){
        Login login=loginDAO.loginUser(username,password);
        if (login==null){
//            model.addAttribute("loginError", "Invalid Username or Password");
            //invalid code here
            return "redirect:/adminloginbox";
        }

        session.setAttribute("adminloggedIn", login);
        return "redirect:/admin/dashboard";
    }

    @RequestMapping (value="/adminlogout" , method=RequestMethod.GET)
    public String logOut(HttpSession session){
        session.removeAttribute("adminloggedIn");

        return "redirect:/admin/adminloginbox";
    }
}
