package project.ims.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import project.ims.dao.BrandDAO;
import project.ims.dao.CategoryDAO;
import project.ims.dao.ProductDAO;
import project.ims.dao.SupplierDAO;
import project.ims.entity.Cart;
import project.ims.entity.Product;

@Controller
@RequestMapping ("/")
public class MainController {

    @Autowired
    ProductDAO productDAO;

    @Autowired
    BrandDAO brandDAO;

    @Autowired
    CategoryDAO categoryDAO;

    @Autowired
    SupplierDAO supplierDAO;

    @RequestMapping(value = "/index")
    public String supplierView(Model model) {
        model.addAttribute("command");
        model.addAttribute("categoryinfo", categoryDAO.getAll());
        model.addAttribute("brandinfo", brandDAO.getAll());
        return "customerwebpage/main/index";
    }

    @RequestMapping(value = "/customerproductview")
    public String productView(Model model, @ModelAttribute("product1") Product product, BindingResult result){
        model.addAttribute("command", new Cart());
        model.addAttribute("filename", productDAO.getAll());
        return "customerwebpage/main/customerproductview";
    }

    @RequestMapping(value = "/customerproductdetails/{id}")
    public String customerProductDetails(@PathVariable("id") int id, Model model){
        model.addAttribute("command", new Product());

        for (Product pro : productDAO.getById(id)){
            model.addAttribute("productinfo", pro);
            model.addAttribute("brand", brandDAO.getByID(productDAO.getByID(id).getBrandId()));
            model.addAttribute("supplier", supplierDAO.getByID(productDAO.getByID(id).getSupplierId()));

            model.addAttribute("categoryinfo",categoryDAO.getAll());
            model.addAttribute("quantity", pro.getProductQuantity());
            model.addAttribute("productall",productDAO.getAll());
            model.addAttribute("brandinfo",brandDAO.getAll());
            model.addAttribute("supplierall",supplierDAO.getAll());
            model.addAttribute("cart", new Cart());
        }
        return "customerwebpage/main/customerproductdetails";
    }

    @RequestMapping(value = "/customerproductview/category/{id}")
    public String productsByCategory(@PathVariable("id") int id, Model model){
        model.addAttribute("command", new Product());
        model.addAttribute("productall", productDAO.getAll());
        model.addAttribute("categoryall",categoryDAO.getAll());
        model.addAttribute("categoryinfo", categoryDAO.getByID(id));
        model.addAttribute("brandall",brandDAO.getAll());
        model.addAttribute("supplierall",supplierDAO.getAll());

        return "customerwebpage/main/productbycategory";
    }

    @RequestMapping(value = "customerproductview/brand/{id}")
    public String productByBrand(@PathVariable("id") int id , Model model){
        model.addAttribute("command", new Product());
        model.addAttribute("productall", productDAO.getAll());
        model.addAttribute("categoryall",categoryDAO.getAll());
        model.addAttribute("brandinfo", brandDAO.getByID(id));
        model.addAttribute("brandall",brandDAO.getAll());
        model.addAttribute("supplierall",supplierDAO.getAll());

        return "customerwebpage/main/productbybrand";
    }

    @RequestMapping(value = "/customerproductview/supplier/{id}")
    public String productsBySupplier(@PathVariable("id") int id, Model model){
        model.addAttribute("command", new Product());
        model.addAttribute("productall", productDAO.getAll());
        model.addAttribute("categoryall",categoryDAO.getAll());
        model.addAttribute("supplierinfo", supplierDAO.getByID(id));
        model.addAttribute("brandall",brandDAO.getAll());
        model.addAttribute("supplierall",supplierDAO.getAll());

        return "customerwebpage/main/productbysupplier";
    }

    @RequestMapping(value = "/contact")
    public String contactDetails(Model model){
        model.addAttribute("command");
        return "customerwebpage/main/contact";
    }

    @RequestMapping(value = "/customerprofile")
    public String profileDetails(Model model){
        model.addAttribute("command");
        return "customerwebpage/main/customerprofile";
    }
}
