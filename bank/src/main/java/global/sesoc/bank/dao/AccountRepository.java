package global.sesoc.bank.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.bank.dto.Account;
import global.sesoc.bank.dto.Accountlog;
import global.sesoc.bank.dto.Customer;

@Repository
public class AccountRepository {

	@Autowired
	SqlSession session;

	public int accountOpen(Account account) {
		AccountMapper mapper = session.getMapper(AccountMapper.class);
		
		return mapper.insertOne(account);
	}

	public List<Account> selectList(String custid, String accounttype, String accountno, String approval) {
		AccountMapper mapper = session.getMapper(AccountMapper.class);
		Map<String, String> map = new HashMap<>();
		map.put("custid", custid);
		map.put("accounttype", accounttype);
		map.put("accountno", accountno);
		map.put("approval", approval);
		System.out.println(map);
		
		return mapper.selectList(map);
	}

	public int updateBalance(Account account) {
		AccountMapper mapper = session.getMapper(AccountMapper.class);
		
		return mapper.updateBalance(account);
	}

	public int insertLog(Accountlog accountlog) {
		AccountMapper mapper = session.getMapper(AccountMapper.class);
		
		return mapper.insertLog(accountlog);
	}

	public int transfer(Accountlog accountlog) {
		AccountMapper mapper = session.getMapper(AccountMapper.class);

		return mapper.transfer(accountlog);
	}

	public Customer lookup(String accountno) {
		AccountMapper mapper = session.getMapper(AccountMapper.class);
		
		return mapper.lookup(accountno);
	}

	public List<Accountlog> selectLogList(String accountno, String eventtype, String order, String fromdate,
			String todate, int srow, int erow) {
		AccountMapper mapper = session.getMapper(AccountMapper.class);
		
		Map<String, Object> map = new HashMap<>();
		map.put("accountno", accountno);
		map.put("eventtype", eventtype);
		map.put("order", order);
		map.put("fromdate", fromdate);
		map.put("todate", todate);
		map.put("srow", srow);
		map.put("erow", erow);
		
		return mapper.selectLogList(map);
	}

	public int loanProcess(Accountlog accountlog) {
		AccountMapper mapper = session.getMapper(AccountMapper.class);

		return mapper.loanProcess(accountlog);
	}

	public Account getBalance(String accountno) {
		AccountMapper mapper = session.getMapper(AccountMapper.class);
		
		return mapper.getBalance(accountno);
	}

	public int getAccountListCount(String accountno, String eventtype, String order, String fromdate, String todate) {
		AccountMapper mapper = session.getMapper(AccountMapper.class);
		
		Map<String, String> map = new HashMap<>();
		map.put("accountno", accountno);
		map.put("eventtype", eventtype);
		map.put("order", order);
		map.put("fromdate", fromdate);
		map.put("todate", todate);
		
		return mapper.getAccountListCount(map);
	}

	public int approveLoan(String accountno) {
		AccountMapper mapper = session.getMapper(AccountMapper.class);
		
		return mapper.approveLoan(accountno);
	}
	
	public int denyLoan(String accountno) {
		AccountMapper mapper = session.getMapper(AccountMapper.class);
		
		return mapper.denyLoan(accountno);
	}
}
