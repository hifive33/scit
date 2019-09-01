package global.sesoc.bank.dao;

import global.sesoc.bank.dto.Customer;

public interface MemberMapper {
	int insertCustomer(Customer customer);
	Customer selectOne(Customer customer);
	int updateOne(Customer customer);
	String selectPassword(Customer customer);
	String findId(Customer customer);
	String findPassword(Customer customer);
	String idCheck(String custid);
}
