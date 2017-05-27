package project.ims.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import project.ims.dao.LoginDAO;
import project.ims.entity.Login;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/")
public class LoginController {

    @Autowired
    LoginDAO loginDAO;

    @RequestMapping(value="/login" , method= RequestMethod.GET)
    public String viewLoginForm (Model model ){
        model.addAttribute("command", new Login());
        return "customerwebpage/main/login";
    }

    @RequestMapping(value="/login" , method=RequestMethod.POST)
//    @ResponseBody
    public String getStartedClicked (@RequestParam ("username") String username ,
                                     @RequestParam ("password") String password , Model model, HttpSession session){
        Login login=loginDAO.loginUser(username,password);
        if (login==null){
//            model.addAttribute("loginError", "Invalid Username or Password");
            //invalid code here
            return "redirect:/login";
        }

        session.setAttribute("loggedIn", login);
        return "redirect:/index";
    }

    @RequestMapping (value="/logout" , method=RequestMethod.GET)
    public String logOut(HttpSession session){
        session.removeAttribute("loggedIn");
        session.removeAttribute("cart");
        return "redirect:/index";
    }
}
