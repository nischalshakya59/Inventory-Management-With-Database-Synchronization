package project.ims.controller;

import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import project.ims.dao.AddressDAO;
import project.ims.dao.SupplierDAO;
import project.ims.entity.Address;
import project.ims.entity.Supplier;
import project.ims.entity.UserDetails;
import project.ims.dao.UserDAO;

@Controller
@RequestMapping("/")
public class SupplierController {

    @Autowired
    UserDAO userdao;
    @Autowired
    AddressDAO addressdao;
    @Autowired
    SupplierDAO supplierdao;

    // display supplier insert form   
    @RequestMapping(value = "/admin/supplier/supplierinsertform", method = RequestMethod.GET)
    public String suppluerInsertFrom(Model model) {
        model.addAttribute("command", new UserDetails());
        model.addAttribute("addressinfo", new Address());
        return "supplier/supplierinsert";
    }

    // insert into supplier
    @RequestMapping(value = "/supplierinsert", method = RequestMethod.POST)
    public String supplierInsert(@Valid
            @ModelAttribute("userdetails1") UserDetails userdetails,
            @Valid @ModelAttribute("address1") Address address) {

        userdetails.setUserType("supplier");
        userdao.insert(userdetails);
        addressdao.insert(address);

        Supplier supplier = new Supplier();
        supplier.setAddressId(address);
        supplier.setUserdetailsId(userdetails);
        supplierdao.insert(supplier);

        return "redirect:/admin/supplier/supplierview";
    }

    //display supplier editform
    @RequestMapping(value = "/supplier/supplieredit/{id}", method = RequestMethod.GET)
    public String supplierEdit(@PathVariable("id") int id, Model model) {
        model.addAttribute("command", new UserDetails());
        model.addAttribute("addressinfo", supplierdao.getByID(id).getAddressId());
        model.addAttribute("userinfo", supplierdao.getByID(id).getUserdetailsId());
        model.addAttribute("supplierinfo", supplierdao.getByID(id));
        return "supplier/supplieredit";
    }

    // supplier update method
    @RequestMapping(value = "/supplieredit", method = RequestMethod.POST)
    public String supplierEdit(@Valid @ModelAttribute("userdetails1") UserDetails userdetails, BindingResult result,
            @Valid @ModelAttribute("address1") Address address, BindingResult result1,
            @ModelAttribute("supplier1") Supplier supplier, BindingResult result2) {
        if (result.hasErrors() || result1.hasErrors()) {
            return "redirect:/supplieredit";
        }
        
        addressdao.update(address);
        userdetails.setUserType("supplier");
        userdao.update(userdetails);

        return "redirect:/admin/supplier/supplierview";
    }

    //supplier delete method
    @RequestMapping(value = "/admin/supplierdel/{id}", method = RequestMethod.GET)
    public String brandDelete(@PathVariable("id") int id) {
        System.out.println("the deleted supplier id is " + id);
        List<Supplier> sup = supplierdao.getById(id);

        for (Supplier supplier : sup) {
            Address address = supplier.getAddressId();
            UserDetails userdetails = supplier.getUserdetailsId();
            addressdao.delete(address.getAddressId());
            userdao.delete(userdetails.getUserdetailsId());
        }
        return "redirect:/admin/supplier/supplierview";
    }

    // display supplier view
    @RequestMapping(value = "/admin/supplier/supplierview", method = RequestMethod.GET)
    public String supplierView(Model model) {
        model.addAttribute("supplierinfo", supplierdao.getAll());
        return "supplier/supplierview";
    }
}
