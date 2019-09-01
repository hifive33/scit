package global.sesoc.bank.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session) {
		return (session.getAttribute("loginId") == null) ? "redirect:/login" :
				(session.getAttribute("loginDivision").equals("admin") ? "redirect:/admin/adm_loan" : "redirect:/account/haveaccount");
	}
	
}
