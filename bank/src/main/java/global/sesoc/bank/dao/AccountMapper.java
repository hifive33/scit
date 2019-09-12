package global.sesoc.bank.dao;

import java.util.List;
import java.util.Map;

import global.sesoc.bank.dto.Account;
import global.sesoc.bank.dto.Accountlog;
import global.sesoc.bank.dto.Customer;

public interface AccountMapper {

	int insertOne(Account account);
	List<Account> selectList(Map<String, String> map);
	int updateBalance(Account account);
	int insertLog(Accountlog accountlog);
	int transfer(Accountlog accountlog);
	Customer lookup(String accountno);
	List<Accountlog> selectLogList(Map<String, Object> map);
	int loanProcess(Accountlog accountlog);
	Account getBalance(String accountno);
	int getAccountListCount(Map<String, String> map);
	int approveLoan(String accountno);
	int denyLoan(String accountno);
	int checkaccount(String result);
}
