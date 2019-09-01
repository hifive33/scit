package global.sesoc.bank.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import global.sesoc.bank.dao.MemberRepository;
import global.sesoc.bank.dto.Customer;

@Controller
public class CustomerMemberController {
	
	@Autowired
	MemberRepository repo;
	
	@RequestMapping("/login")
	public String login() {
		return "customer/member/login";
	}
	
	@RequestMapping("/login.do")
	public String loginProcess(Customer customer, HttpSession session) {
		customer = repo.selectOne(customer);
		if (customer != null) {
			session.setAttribute("loginId", customer.getCustid());
			session.setAttribute("loginName", customer.getName());
			session.setAttribute("loginIdno", customer.getIdno());
			session.setAttribute("loginEmail", customer.getEmail());
			session.setAttribute("loginAddress", customer.getAddress());
			session.setAttribute("loginDivision", customer.getDivision());
			return "redirect:/";
		} else {
			return "redirect:/login";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/login";
	}
	
	@RequestMapping("/join")
	public String join() {
		return "customer/member/join";
	}

	@RequestMapping("/join.do")
	public String joinProcess(Customer customer) {
		int result = repo.insertCustomer(customer);
		if (result == 1) {
			return "redirect:/login";
		} else {
			return "redirect:/join";
		}
	}
	
	@RequestMapping("/join_pop")
	public String join_pop() {
		return "customer/member/join_pop";
	}
	
	@RequestMapping("/info")
	public String info() {
		return "customer/member/info";
	}
	
	@RequestMapping("/info.do")
	public String infoProcess(Customer customer, RedirectAttributes redirectAttributes) {
		int result = repo.updateOne(customer);
		
		if (result == 1) {
			customer.setPassword(repo.selectPassword(customer));
			redirectAttributes.addFlashAttribute(customer);
			return "redirect:/login.do";
		} else {
			return "redirect:/info";
		}
	}
	
	@RequestMapping("/find_idpw")
	public String find_idpw() {
		return "customer/member/find_idpw";
	}

	@RequestMapping("/findId")
	@ResponseBody
	public String findId(Customer customer) {
		return repo.findId(customer);
	}
	
	@RequestMapping("/findPassword")
	@ResponseBody
	public String findPassword(Customer customer) {
		return repo.findPassword(customer);
	}
	
	@RequestMapping("/idCheck")
	@ResponseBody
	public String idCheck(String custid) {
		
		return repo.idCheck(custid);
	}
	
	
}
