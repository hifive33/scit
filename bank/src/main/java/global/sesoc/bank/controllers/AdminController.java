package global.sesoc.bank.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.bank.dao.AccountRepository;
import global.sesoc.bank.dao.BoardRepository;
import global.sesoc.bank.dto.Qnaboard;
import global.sesoc.bank.utils.PageNavigator;

@RequestMapping("/admin/")
@Controller
public class AdminController {
	
	@Autowired
	AccountRepository accountrepo;
	
	@Autowired
	BoardRepository boardrepo;
	
	@RequestMapping("/adm_loan")
	public String adm_loan(Model model) {
		model.addAttribute("list", accountrepo.selectList(null, null, null, "N"));
		
		return "admin/adm_loan";
	}
	
	@RequestMapping("/adm_loan.do")
	public String adm_loan(String accountno, String action) {
		if (action.equals("approve")) {
			accountrepo.approveLoan(accountno);
		} else {
			accountrepo.denyLoan(accountno);
		}
	
		return "redirect:/admin/adm_loan";
	}
	
	@RequestMapping("/adm_answerlist")
	public String adm_answerlist(String searchItem, String searchWord, Model model,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
		int total = boardrepo.getBoardCount(searchItem, searchWord);
		PageNavigator navi = new PageNavigator(currentPage, total);
		List<Qnaboard>list = boardrepo.selectAll(searchItem,searchWord,navi.getStartRecord(), navi.getCountPerPage());

		model.addAttribute("navi", navi);
		model.addAttribute("list", list);
		return "admin/adm_answerlist";
	}
	
	@RequestMapping("/adm_answerview")
	public String adm_answerview(int boardno, Model model) {
		Qnaboard result = boardrepo.selectOne(boardno);
		boardrepo.updateCount(boardno);
		model.addAttribute("result", result);
		return "admin/adm_answerview";
	}
	
	@RequestMapping("/reply.do")
	@ResponseBody
	public String replyProcess(Qnaboard board, Model model) {
		int result = boardrepo.insertReply(board);
		
		return (result == 1) ? "success" : "failure";
	}
	
}
