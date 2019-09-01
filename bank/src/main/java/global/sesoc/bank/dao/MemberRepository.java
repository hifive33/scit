package global.sesoc.bank.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.bank.dto.Customer;

@Repository
public class MemberRepository {

	@Autowired
	SqlSession session;
	
	
	public int insertCustomer(Customer customer) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);

		return mapper.insertCustomer(customer);
	}


	public Customer selectOne(Customer customer) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		
		return mapper.selectOne(customer);
	}


	public int updateOne(Customer customer) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		
		return mapper.updateOne(customer);
	}


	public String selectPassword(Customer customer) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		
		return mapper.selectPassword(customer);
	}


	public String findId(Customer customer) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
	
		return mapper.findId(customer);
	}


	public String findPassword(Customer customer) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		
		return mapper.findPassword(customer);
	}


	public String idCheck(String custid) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		
		return mapper.idCheck(custid);
	}

}
