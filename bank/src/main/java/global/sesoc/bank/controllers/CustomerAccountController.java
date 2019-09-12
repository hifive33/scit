package global.sesoc.bank.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.bank.dao.AccountRepository;
import global.sesoc.bank.dto.Account;
import global.sesoc.bank.dto.Accountlog;
import global.sesoc.bank.dto.Customer;

@RequestMapping("/account/")
@Controller
public class CustomerAccountController {
	
	@Autowired
	AccountRepository repo;
	
	@RequestMapping("/haveaccount")
	public String haveaccount(HttpSession session, Model model) {
		List<Account> list = repo.selectList((String)session.getAttribute("loginId"), null, null, null);
		model.addAttribute("list", list);
		
		return "customer/account/haveaccount";
	}
	
	@RequestMapping({"/addaccount_1", "addaccount"})
	public String addaccount_1() {
		return "customer/account/addaccount_1";
	}
	
	@RequestMapping("/addaccount.do")
	public String addaccountProcess(Account account, HttpSession session) {
		account.setCustid((String) session.getAttribute("loginId"));
		if (account.getAccounttype().equals("loan")) {
			account.setApproval("N");
		}
		repo.accountOpen(account);
		if (account.getAccounttype().equals("checking")) {
			Accountlog accountlog = new Accountlog((String) session.getAttribute("loginId"), account.getAccountno());
			accountlog.setEventtype("deposit");
			accountlog.setAmount(account.getBalance());
			accountlog.setBalance(account.getBalance());
			repo.insertLog(accountlog);
		}
		return "redirect:haveaccount";
	}
	
	@GetMapping("/setaccount")
	@ResponseBody
	public String setaccount(){
		String result = null;
		int check = 1;
		do{
			result = String.valueOf((int) (Math.random() * 90000) + 10000);
			check = repo.checkaccount(result);
		}while(check == 1);
		result = "1111-111-" + result;
		System.out.println(result);
		return result;
	}
	
	@RequestMapping("/addaccount_2")
	public String addaccount_2() {
		return "customer/account/addaccount_2";
	}
	
	@RequestMapping("/addaccount_3")
	public String addaccount_3() {
		return "customer/account/addaccount_3";
	}
	
	@RequestMapping("/deposit")
	public String deposit() {
		return "customer/account/deposit";
	}
	
	@RequestMapping("/deposit.do")
	public String depositProcess(Account account, HttpSession session) {
		Accountlog accountlog = new Accountlog((String) session.getAttribute("loginId"), account.getAccountno());
		accountlog.setEventtype("deposit");
		accountlog.setAmount(account.getBalance());
		repo.updateBalance(account);
		accountlog.setBalance(account.getBalance());
		repo.insertLog(accountlog);
		
		return "redirect:haveaccount";
	}
	
	@RequestMapping("/withdraw")
	public String withdraw() {
		return "customer/account/withdraw";
	}
	
	@RequestMapping("/withdraw.do")
	public String withdrawProcess(Account account, HttpSession session) {
		Accountlog accountlog = new Accountlog((String) session.getAttribute("loginId"), account.getAccountno());
		accountlog.setEventtype("withdraw");
		accountlog.setAmount(account.getBalance());
		account.setBalance(-account.getBalance());
		repo.updateBalance(account);
		accountlog.setBalance(account.getBalance());
		repo.insertLog(accountlog);
		
		return "redirect:haveaccount";
	}
	
	@RequestMapping("/transfer")
	public String transfer() {
		return "customer/account/transfer";
	}
	
	@RequestMapping("/transfer.do")
	public String transferProcess(Account account, String transferno, HttpSession session) {
		Accountlog accountlog = new Accountlog((String) session.getAttribute("loginId"), account.getAccountno());
		accountlog.setTransferno(transferno);
		accountlog.setAmount(account.getBalance());
		
		repo.transfer(accountlog);
		
		return "redirect:haveaccount";
	}
	
	@RequestMapping("/transfer_pop1")
	public String transfer_pop1(String accountno, HttpSession session, Model model) {
		List<Account> list = repo.selectList((String)session.getAttribute("loginId"), "checking", accountno, null);
		model.addAttribute("list", list);
		
		return "customer/account/transfer_pop1";
	}
	
	@RequestMapping("/transfer_pop2")
	public String transfer_pop2() {
		return "customer/account/transfer_pop2";
	}

	@RequestMapping("/transfer.lookup")
	@ResponseBody
	public Customer transfer_lookup(String accountno) {
		return repo.lookup(accountno);
	}
	
	@RequestMapping("/tradelist")
	public String tradelist() {
		return "customer/account/tradelist";
	}
	
	@RequestMapping("/tradelist.do")
	public String tradelistProcess(Accountlog accountlog, String order, 
			String fromdate, String todate,
			@RequestParam(value="currentPage", defaultValue="1") int currentPage,
			Model model) {
		int countPerPage = 10;
		
		int total = (repo.getAccountListCount(accountlog.getAccountno(), accountlog.getEventtype(), order, fromdate, todate) + countPerPage - 1) / countPerPage;
		currentPage = (currentPage < 1) ? 1 : (currentPage > total) ? total : currentPage;
		
		int srow = (currentPage - 1) * countPerPage + 1;
		int erow = currentPage * countPerPage;
		
		List<Accountlog> list = repo.selectLogList(accountlog.getAccountno(), accountlog.getEventtype(), order, fromdate, todate, srow, erow);
		
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("countPerPage", countPerPage);
		
		return "customer/account/tradelisttable";
	}
	
	@RequestMapping("/loan")
	public String loan() {
		return "customer/account/loan";
	}
	
	@RequestMapping("/loan.do")
	public String loanProcess(Accountlog accountlog, HttpSession session) {
		accountlog.setCustid((String)session.getAttribute("loginId"));
		accountlog.setEventtype("withdraw");
		repo.loanProcess(accountlog);
		
		return "redirect:haveaccount";
	}
	
	@RequestMapping("/loan_pop")
	public String loan_pop(HttpSession session, Model model) {
		List<Account> list = repo.selectList((String)session.getAttribute("loginId"), "checking", null, null);
		model.addAttribute("list", list);
		
		return "customer/account/loan_pop";
	}

	@RequestMapping("/getBalance")
	@ResponseBody
	public Account getBalance(String accountno) {
		
		return repo.getBalance(accountno);
	}
}
