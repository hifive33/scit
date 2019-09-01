package global.sesoc.bank.controllers;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import global.sesoc.bank.dao.BoardRepository;
import global.sesoc.bank.dto.Qnaboard;
import global.sesoc.bank.utils.FileService;
import global.sesoc.bank.utils.PageNavigator;

@Controller
public class CustomerBoardController {

	@Autowired
	BoardRepository repo;

	final String uploadPath = "/uploadfile";

	@RequestMapping("/board_write")
	public String write(){
		return "customer/board/board_write";
	}

	@RequestMapping("/board_write.do")
	public String write(Qnaboard board, RedirectAttributes rttr, MultipartFile upload){
		board.setOriginalfile(upload.getOriginalFilename());
		board.setSavedfile(FileService.saveFile(upload, uploadPath));

		repo.insertBoard(board); 
		
		rttr.addAttribute("boardno", board.getBoardno());
		return "redirect:/board_view";
	}

	@RequestMapping("/board_view")
	public String board_view(int boardno,Model model){
		Qnaboard result = repo.selectOne(boardno);
		repo.updateCount(boardno);
		model.addAttribute("result", result);
		return "customer/board/board_view";
	}

	@RequestMapping("/board_delete")
	public String delete(int boardno, boolean flag) {
		
        File file = new File(uploadPath + "/" + repo.selectOne(boardno).getSavedfile());
        if(file.exists() && file.delete()) System.out.println("파일삭제 성공");

        repo.deleteBoard(boardno);

		return (flag) ? "redirect:/admin/adm_answerlist" : "redirect:/board_list";
	}

	@RequestMapping("/board_update")
	public String update(int boardno, Model model) {
		Qnaboard result = repo.selectOne(boardno);
		result.setBoardno(boardno);
		model.addAttribute("model", result);
		return "customer/board/board_update";
	}

	@RequestMapping("/board_update.do")
	public String update(Qnaboard board, RedirectAttributes rttr, MultipartFile upload) {
		Qnaboard tempboard = repo.selectOne(board.getBoardno());
		
		if ((upload != null) && (!upload.isEmpty()) &&
			(tempboard.getSavedfile() != null)) {
			
	        File file = new File(uploadPath + "/" + tempboard.getSavedfile());
	        if(file.exists()) file.delete();
			
			board.setOriginalfile(upload.getOriginalFilename());
			board.setSavedfile(FileService.saveFile(upload, uploadPath));
		}
		
		repo.updateBoard(board);
		rttr.addAttribute("boardno", board.getBoardno());
		return "redirect:/board_view";
	}

	@RequestMapping("/board_list")
	public String list(String searchItem, String searchWord, Model model,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
		int total = repo.getBoardCount(searchItem, searchWord);
		PageNavigator navi = new PageNavigator(currentPage, total);
		List<Qnaboard>list = repo.selectAll(searchItem,searchWord,navi.getStartRecord(), navi.getCountPerPage());

		model.addAttribute("navi", navi);
		model.addAttribute("list", list);
		return "customer/board/board_list";

	}

	@RequestMapping("/download")
	public String download(int boardno, HttpServletResponse response) throws FileNotFoundException {
		Qnaboard board = repo.selectOne(boardno);
		String savedfile = board.getSavedfile();
		String originalfile = null;
		
		try {
			originalfile = URLEncoder.encode(board.getOriginalfile(), "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		response.setHeader("Content-Disposition", "attachment;filename=" + originalfile);
		
		String fullPath = uploadPath + "/" + savedfile;
		
		try (FileInputStream filein = new FileInputStream(fullPath);
			ServletOutputStream fileout = response.getOutputStream();){
			FileCopyUtils.copy(filein, fileout);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
