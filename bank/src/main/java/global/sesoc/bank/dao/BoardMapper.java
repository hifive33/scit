package global.sesoc.bank.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.bank.dto.Qnaboard;

public interface BoardMapper {

	int insertBoard(Qnaboard board);
	Qnaboard selectOne(int boardno);
	int deleteBoard(int boardno);
	int updateBoard(Qnaboard board);
	List<Qnaboard> selectAll(Map<String,String>map,RowBounds rb);
	int getBoardCount(Map<String,String>map);
	int updateCount(int boardno);
	int insertReply(Qnaboard board);
}
