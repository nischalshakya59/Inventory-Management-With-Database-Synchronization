package project.ims.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import project.ims.dao.CategoryDAO;
import project.ims.entity.Category;

import javax.validation.Valid;
import java.util.List;


@Controller
@RequestMapping("/")

public class CategoryController {

    @Autowired
    CategoryDAO categoryDAO;

//    insertform page
    @RequestMapping(value = "/admin/category/categoryinsertform", method = RequestMethod.GET)
    public String cateogryInsertForm(Model model){
        model.addAttribute("command", new Category());
        model.addAttribute("category",categoryDAO.getAll());
        return "category/categoryinsert";
    }

//    insert operation
    @RequestMapping(value = "/categoryinsert", method = RequestMethod.POST)
    public String categoryInsert(@Valid @RequestParam ("parentId") int id, @ModelAttribute ("category")Category category, BindingResult result){
//        if (result.hasErrors()) {
//            ModelAndView mvn = new ModelAndView("category/categoryinsert", "command", new Category());
//            return "redirect:/categoryinsert";
//        }

        category.setParentId(categoryDAO.getByID(id));
        categoryDAO.insert(category);
        return "redirect:/admin/category/categoryview";
    }

//    view page
    @RequestMapping(value = "/admin/category/categoryview", method = RequestMethod.GET)
    public String cateogryView(Model model){
        model.addAttribute("categoryinfo",categoryDAO.getAll());
        return "category/categoryview";
    }

//    edit form page
    @RequestMapping(value = "/category/categoryedit/{id}", method = RequestMethod.GET)
    public String categoryEditForm(@PathVariable("id") int id, Model model) {
//        System.out.println("Edit reached !!!!!!!!!!!!!!!!!!!!!!! "+ id);
        for (Category cat:categoryDAO.getById(id)){
//            System.out.println("....................................."+cat.getCategoryName());
            model.addAttribute("command",new Category());
            model.addAttribute("category",categoryDAO.getAll());
            model.addAttribute("categoryinfo",cat);
        }
        return "category/categoryedit";
    }

    //    edit operation
    @RequestMapping(value = "/categoryedit", method = RequestMethod.POST)
    public String categoryEdit(@Valid @RequestParam ("parentId") int pId,
                               @ModelAttribute("category1") Category category, BindingResult result){
//        if (result.hasErrors()) {
//            ModelAndView mvn = new ModelAndView("category/categoryedit", "command", new Category());
//            return "redirect:/categoryedit";
//        }

        if(pId==1){
            for (Category cat:categoryDAO.getById(pId)){
//                System.out.println("....."+cat.getCategoryName());
                category.setParentId(cat);
            }
        }
        else{
            category.setParentId(categoryDAO.getByID(pId));
        }


        categoryDAO.update(category);
        return "redirect:/admin/category/categoryview";
    }

//    delete method
    @RequestMapping(value = "/admin/category/categorydelete/{id}", method = RequestMethod.GET)
    public String cateogryDelete(@PathVariable("id") int id,Model model){
        model.addAttribute("command", new Category());
        categoryDAO.delete(id);
        return "redirect:/admin/category/categoryview";
    }
}
