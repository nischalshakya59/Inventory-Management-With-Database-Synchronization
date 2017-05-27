package project.ims.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import project.ims.dao.*;
import project.ims.entity.*;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Sabin on 2016-08-31.
 */
@Controller
public class OrderController {
    @Autowired
    OrderDAO orderDAO;

    @Autowired
    OrderDetailsDAO ODDAO;

    @Autowired
    CartDAO cartDAO;

    @Autowired
    CustomerDAO cdao;

    @Autowired
    ProductDAO productDAO;

    @RequestMapping(value = "/orderplace")
    public String addOrder(HttpSession session, Model model){
        System.out.println("REACHED TO ORDER PLACE");
        Login login= (Login) session.getAttribute("loggedIn");
        List<Cart> cartList = (List<Cart>) session.getAttribute("cart");
        System.out.println("--------------------------------------before cmustomer----------");
        Customer customer=cdao.getCustomer(login.getLoginId());
        System.out.println("--------------------------------------after cmustomer----------");

        OrderDetails od=new OrderDetails();
        od.setCustomerId(customer.getCustomerId());
        od.setOrderDate(new java.sql.Date(System.currentTimeMillis()));
        od.setShippingAmount(250.0);
        od.setOrderStatus(false);

        Double total=cartDAO.calculateTotal(cartList);
        Double discount=total *0.05;

        od.setTotalAmount(total);
        od.setDiscount(discount);
        od.setGrandtotal((total-discount));

        ODDAO.insert(od);
        System.out.println("-------------------------INSERTED TO ORDER DETAILS--------------------");

        Order order=new Order();
        order.setOrderId("on_"+String.valueOf(od.getOrderDetailsId()));
        order.setSyncStatus(false);
        order.setOrderDetailsId(od);

        orderDAO.insert(order);
        System.out.println("-----------------------------------INSERTED TO ORDER----------------------------");
        Product product=new Product();
        for(Cart cart:cartList){
            cart.setOrderId(order);
            cartDAO.insert(cart);

// -----------------------------------------Please don't delete these comments-----------------------------------
            product=cart.getProductId();
            product.setProductQuantity(product.getProductQuantity()-cart.getQuantity());
            productDAO.update(product);
        }

        System.out.println("---------------------------------INSERTED TO CART-----------------------------------");

//        session.removeAttribute("cart");

//        model.addAttribute("allorderdetails",ODDAO.getById(customer.getCustomerId()));
//        model.addAttribute("allorder", orderDAO.getAll());
//        model.addAttribute("allcart",cartDAO.getAll());
        return "/customerwebpage/main/index";
    }

}
