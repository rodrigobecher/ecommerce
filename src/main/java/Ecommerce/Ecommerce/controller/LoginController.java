package Ecommerce.Ecommerce.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LoginController {

	@RequestMapping(value ="/login", method=RequestMethod.GET)
	public String loginForm() {
		return "loginForm";
	}
	@RequestMapping(value ="/pag", method=RequestMethod.GET)
	public ModelAndView pag(RedirectAttributes model) {
		ModelAndView mv = new ModelAndView("loginForm");
		model.addFlashAttribute("mensagem", "Efetue o Login ou Cadastre-se");
		return mv;
	}
	
	
}
