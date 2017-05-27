package project.ims.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import project.ims.bckrest.BackUpRestore;
import project.ims.dao.BrandDAO;
import project.ims.entity.BckRest;
import project.ims.entity.Brand;

@Controller
@RequestMapping("/")
public class BrandController {

	@Value("${application.message:Hello World}")
	private String message = "Hello World";

	@Autowired
	BrandDAO bdao;

	// insert brand method
	@RequestMapping(value = "/brandinsert", method = RequestMethod.POST)
	public String brandInsert(@Valid @ModelAttribute("brand1") Brand brand, BindingResult result) {

		if (result.hasErrors()) {
			ModelAndView mvn = new ModelAndView("brand/brandinsert", "command", new Brand());
			return "redirect:brand/brandinsert";
		}

		bdao.insert(brand);

		return "redirect:/admin/brand/brandview";
	}

	// display brand table
	@RequestMapping(value = "/admin/brand/brandview", method = RequestMethod.GET)
	public ModelAndView brandView(@Valid @ModelAttribute("brand1") Brand brand, BindingResult result) {

		if (result.hasErrors()) {
			ModelAndView mvn = new ModelAndView("brand/brandview", "command", new Brand());
			return mvn;
		}
		ModelAndView mv = new ModelAndView("brand/brandview", "command", new Brand());
		mv.addObject("brand", bdao.getAll());
		return mv;
	}

	// display brand edit form
	@RequestMapping(value = "/brand/brandedit/{id}", method = RequestMethod.GET)
	public ModelAndView editBrand(@PathVariable("id") int id) {
		ModelAndView mv = new ModelAndView("brand/brandedit", "command", new Brand());
		mv.addObject("brand", bdao.getByID(id));
		System.out.println("edit form reached");
		return mv;
	}

	// brand update method
	@RequestMapping(value = "/brandedit", method = RequestMethod.POST)
	public String brandEdit(@Valid @ModelAttribute("brand1") Brand brand, BindingResult result) {
		if (result.hasErrors()) {
			return "redirect:/admin/brand/brandedit";
		}
		System.out.println("edit brand name " + brand.getBrandName());
		bdao.update(brand);
		return "redirect:/admin/brand/brandview";
	}

	// brand delete method
	@RequestMapping(value = "/admin/branddel/{id}", method = RequestMethod.GET)
	public String brandDelete(@PathVariable("id") int id) {
		System.out.println("the deleted brand id is " + id);
		bdao.delete(id);
		return "redirect:/admin/brand/brandview";
	}

	// display brand insert form
	@RequestMapping(value = "/admin/brand/brandinsertform", method = RequestMethod.GET)
	public String brandInsertForm(Model model) {
		model.addAttribute("command", new Brand());
		return "brand/brandinsert";
	}

	// display brand restore form
	@RequestMapping(value = "brand/brandrestoreform", method = RequestMethod.GET)
	public String brandRestore(Model model) throws ClassNotFoundException, SQLException {
		model.addAttribute("command", new BckRest());
		return "backuprestore/bckrest";
	}

	// brand restore
	@RequestMapping(value = "/brandrestore", method = RequestMethod.POST)
	public String brandBck(@RequestParam("filepath") MultipartFile restorefilename)
			throws IllegalStateException, IOException {
		try {
			File temp_file = new File("c:/DBBck/" + restorefilename.getOriginalFilename());
			restorefilename.transferTo(temp_file);
			System.out.println("the absolute file path is " + temp_file.getAbsolutePath());
			new BackUpRestore().restore(temp_file.getAbsolutePath());
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:/admin/brand/brandview";
	}

	// brand backup
	@RequestMapping(value = "/brand/brandbackup", method = RequestMethod.GET)
	public String brandBackup(Model model) {
		model.addAttribute("command", new BckRest());
		return "backuprestore/backup";
	}
}
