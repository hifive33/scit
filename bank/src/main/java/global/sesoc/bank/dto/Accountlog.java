package global.sesoc.bank.dto;

public class Accountlog {
	private String logid;
	private String custid;
	private String accountno;
	private String transferno;
	private String eventdate;
	private String eventtype;
	private String eventrecord;
	private int amount;
	private int balance;
	
	public Accountlog() {
	}
	public Accountlog(String custid, String accountno) {
		this.custid = custid;
		this.accountno = accountno;
	}
	public String getLogid() {
		return logid;
	}
	public void setLogid(String logid) {
		this.logid = logid;
	}
	public String getCustid() {
		return custid;
	}
	public void setCustid(String custid) {
		this.custid = custid;
	}
	public String getAccountno() {
		return accountno;
	}
	public void setAccountno(String accountno) {
		this.accountno = accountno;
	}
	public String getTransferno() {
		return transferno;
	}
	public void setTransferno(String transferno) {
		this.transferno = transferno;
	}
	public String getEventdate() {
		return eventdate;
	}
	public void setEventdate(String eventdate) {
		this.eventdate = eventdate;
	}
	public String getEventtype() {
		return eventtype;
	}
	public void setEventtype(String eventtype) {
		this.eventtype = eventtype;
	}
	public String getEventrecord() {
		return eventrecord;
	}
	public void setEventrecord(String eventrecord) {
		this.eventrecord = eventrecord;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	@Override
	public String toString() {
		return "Accountlog [logid=" + logid + ", custid=" + custid + ", accountno=" + accountno + ", transferno="
				+ transferno + ", eventdate=" + eventdate + ", eventtype=" + eventtype + ", eventrecord=" + eventrecord
				+ ", amount=" + amount + ", balance=" + balance + "]";
	}
}
