package project.ims.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import project.ims.dao.CartDAO;
import project.ims.dao.ProductDAO;
import project.ims.entity.Cart;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Controller
public class CartController {

    @Autowired
    ProductDAO productDAO;

    @Autowired
    CartDAO cartDAO;

    @RequestMapping(value = "/addtocart/{id}")
    public String addToCart(@Valid @PathVariable  ("id") int id, @ModelAttribute("cart")Cart cart, BindingResult result, HttpSession session
    , @RequestParam("quantity") int qu, @RequestHeader ("referer") String referredFrom, Model model){

        cart.setQuantity(qu);
//        cart.setAddedDate(new java.sql.Date(System.currentTimeMillis()));
        System.out.println("////////////////////////////////////////////: productId:"+id);

        cart.setProductId(productDAO.getByID(id));
        cart.setRate((cart.getProductId().getProductPrice()));
        int total=0;

        total=(cart.getQuantity()*cart.getRate());
        System.out.println("----------------------------"+total+"----------------------"+Double.parseDouble(String.valueOf(total)));
        cart.setTotalAmount(Double.parseDouble(String.valueOf(total)));

        List<Cart> cartList = (List<Cart>) session.getAttribute("cart");

        if(cartList== null){
            System.out.println("-----------------------------NULL CART LIST---------------------------------------");
            cartList = new ArrayList<>();
            cartList.add(cart);
        }else{
            for(Cart crt: cartList){
                if (crt.getProductId().getProductId()==id) {
                    System.out.println("---------------------"+crt.getProductId().getProductId()+"--------------------------------");
                    System.out.println("---------------------"+id+"---------------------------");
                    crt.setQuantity(crt.getQuantity()+qu);
                    total=(crt.getQuantity()*cart.getRate());
                    crt.setTotalAmount(Double.parseDouble(String.valueOf(total)));
                    System.out.println("----------------------------"+total+"----------------------"+Double.parseDouble(String.valueOf(total)));
                    return "redirect:"+referredFrom;
                }
            }

            cartList.add(cart);
        }
        session.setAttribute("cart", cartList);
        System.out.println(session.getId());
        return "redirect:"+referredFrom;
    }

    @RequestMapping (value="/checkout")
    public String viewcart(HttpSession session, Model model){
        List<Cart> cartList = (List<Cart>) session.getAttribute("cart");
            if(cartList==null){
                model.addAttribute("total",0.0);
                model.addAttribute("discount",0.0);
                model.addAttribute("grand",0.0 );
                return "/customerwebpage/main/checkout";
            }

        model.addAttribute("allcart", cartList);
        Double total=cartDAO.calculateTotal(cartList);
        Double discount=total *0.05;
        model.addAttribute("total",total );
        model.addAttribute("discount",discount);
        model.addAttribute("grand",(total-discount) );
        return "/customerwebpage/main/checkout";
    }

    @RequestMapping (value="/cartdel/{id}")
    public String delCart(@PathVariable ("id") int id, HttpSession session, @RequestHeader ("referer") String referredFrom){
        List<Cart> cartList = (List<Cart>) session.getAttribute("cart");


        for (Iterator<Cart> iterator = cartList.iterator(); iterator.hasNext();) {
            Cart cart = iterator.next();
            if (cart.getProductId().getProductId()==id) {
                iterator.remove();
                return "redirect:"+referredFrom;
            }
        }
//        session.setAttribute("cart", cartList);
        return "redirect:"+referredFrom;
    }

}
