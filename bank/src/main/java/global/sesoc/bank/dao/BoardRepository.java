package global.sesoc.bank.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.bank.dto.Qnaboard;

@Repository
public class BoardRepository {

	@Autowired
	SqlSession session;
	
	public int insertBoard(Qnaboard board){
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		int result = mapper.insertBoard(board);
		return result;
	}
	
	public Qnaboard selectOne(int boardno) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		Qnaboard result = mapper.selectOne(boardno);
		return result;
	}
	
	public int deleteBoard(int boardno) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		int result = mapper.deleteBoard(boardno);
		return result;
	}
	
	public int updateBoard(Qnaboard board){
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		int result = mapper.updateBoard(board);
		return result;
	}
	
	public List<Qnaboard> selectAll(String searchItem,String searchWord, int startRecord, int countPerPage){
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		RowBounds rb = new RowBounds(startRecord,countPerPage);
		Map<String,String>map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchWord",searchWord);
		List<Qnaboard>list = mapper.selectAll(map,rb);
		return list;
	}
	
	public int getBoardCount(String searchItem,String searchWord) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		Map<String,String>map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchWord",searchWord);
		int result = mapper.getBoardCount(map);
		return result;
	}
	
	public int updateCount(int boardno) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		int result = mapper.updateCount(boardno);
		return result;
	}

	public int insertReply(Qnaboard board) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		return mapper.insertReply(board);
	}
}
