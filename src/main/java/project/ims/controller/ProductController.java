package project.ims.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import project.ims.dao.BrandDAO;
import project.ims.dao.CategoryDAO;
import project.ims.dao.ProductDAO;
import project.ims.dao.SupplierDAO;
import project.ims.entity.Brand;
import project.ims.entity.Product;
import javax.validation.Valid;
@Controller
public class ProductController {

    @Autowired
    ProductDAO productDAO;

    @Autowired
    BrandDAO brandDAO;

    @Autowired
    CategoryDAO categoryDAO;

    @Autowired
    SupplierDAO supplierDAO;



    //display insert form
    @RequestMapping(value = "/admin/product/productinsertform", method = RequestMethod.GET)
    public String productInsertForm(Model model){
        model.addAttribute("command", new Product());
        model.addAttribute("brandinfo", brandDAO.getAll());
        model.addAttribute("categoryinfo", categoryDAO.getAll());
        model.addAttribute("supplierinfo", supplierDAO.getAll());
        return "product/productinsert";
    }

    // insert product method
    @RequestMapping(value = "/productinsert", method = RequestMethod.POST)
    public String productInsert(@Valid @ModelAttribute("product1") Product product, BindingResult result,
                                @Valid @ModelAttribute("brand1") Brand brand,BindingResult result1,
                                @RequestParam("productImage") MultipartFile file,
                                @RequestParam("brandId") int bid,
                                @RequestParam("categoryId") int cid,
                                @RequestParam("supplierId") int sid
                               ) {

//        if (result.hasErrors()) {
//            ModelAndView mvn = new ModelAndView("product/productinsert", "command", new Product());
//            return "redirect:/productinsert";
//        }

        String imagefile = productDAO.fileWorks(file);
        System.out.println(",,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,");
        System.out.println("image file name = " + imagefile);
        String imagepath = productDAO.imagesplit(imagefile);
        System.out.println(".......................imagepath controler ko = "+ imagepath);

        //brandDAO.insert(brand);
        product.setBrandId(bid);
        product.setCategoryId(categoryDAO.getByID(cid));
        product.setSupplierId(sid);

        product.setProductEntrydate(new java.sql.Time(System.currentTimeMillis()));

        product.setProductImage(imagepath);
        productDAO.insert(product);

        return "redirect:/admin/product/productview";
    }
    
    //update form
    @RequestMapping(value = "/productviewdetails/productedit/{id}", method = RequestMethod.GET)
    public String productEdit(@PathVariable("id") int id, Model model) {
        model.addAttribute("command", new Product());
        model.addAttribute("brand", brandDAO.getAll());
        model.addAttribute("brandinfo", brandDAO.getByID(productDAO.getByID(id).getBrandId()));
        model.addAttribute("supplier", supplierDAO.getAll());
        model.addAttribute("supplierinfo", supplierDAO.getByID(productDAO.getByID(id).getSupplierId()));
        model.addAttribute("categoryinfo", categoryDAO.getAll());
        for (Product pro : productDAO.getById(id)){
            model.addAttribute("productinfo", pro);
        }
        return "product/productedit";

    }
    //update method
    @RequestMapping(value = "/productedit", method = RequestMethod.POST)
    public String productEdit(@Valid @ModelAttribute("product1") Product product, BindingResult result,
                              @RequestParam("productImage") MultipartFile file,
                              @RequestParam("brandId") int bid,
                              @RequestParam("categoryId") int cid,
                              @RequestParam("supplierId") int sid,
                              @RequestParam("productId") int id
    ){
        System.out.println("lalalalalal......   " + id);
        System.out.println("....................................................................."+file.getOriginalFilename());
        String imagefile = productDAO.fileWorks(file);
        System.out.println(",,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,");
        System.out.println("updated image file name = " + imagefile);
        String imagepath = productDAO.imagesplit(imagefile);
        System.out.println(".......................updated imagepath controler ko = "+ imagepath);

        product.setBrandId(bid);
        product.setCategoryId(categoryDAO.getByID(cid));
        product.setSupplierId(sid);
        product.setProductImage(imagepath);

        product.setProductEntrydate(productDAO.getByID(id).getProductEntrydate());
        product.setProductModifieddate(new java.sql.Time(System.currentTimeMillis()));
        productDAO.update(product);

        return "redirect:/admin/product/productview";
    }

    //delete method
    @RequestMapping(value = "/admin/product/productviewdetails/productdel/{id}", method = RequestMethod.GET)
    public String productDelete(@PathVariable("id") int id, Model model){
        System.out.println("deleting id............................ = " + id);
        productDAO.delete(id);
        model.addAttribute("command",new Product());
        return "redirect:/admin/product/productview";
    }


    //product display section
    @RequestMapping(value = "/admin/product/productview", method = RequestMethod.GET)
    public String productView(Model model, @ModelAttribute("product1") Product product, BindingResult result){
        model.addAttribute("filename", productDAO.getAll());
        return "product/productview";
    }

    @RequestMapping(value = "/product/productviewdetails/{id}", method = RequestMethod.GET)
    public String productViewDetails(@PathVariable("id") int id, Model model){
        model.addAttribute("command", new Product());
        for (Product pro : productDAO.getById(id)){
            System.out.println(".....................");
            System.out.println("id="+pro.getProductId());
            System.out.println("/......................brnadid: " + pro.getBrandId());
            model.addAttribute("productinfo", pro);
            model.addAttribute("brand", brandDAO.getByID(productDAO.getByID(id).getBrandId()));
            model.addAttribute("supplier", supplierDAO.getByID(productDAO.getByID(id).getSupplierId()));

        }
        return "product/productviewdetails";
    }


}

