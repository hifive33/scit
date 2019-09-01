package global.sesoc.bank.dto;

public class Account {
	private String accountno;
	private String custid;
	private String accounttype;
	private int balance;
	private int payment;
	private double interest;
	private String startdeposit;
	private String enddeposit;
	private String approval;
	private String years;
	
	public String getAccountno() {
		return accountno;
	}
	public void setAccountno(String accountno) {
		this.accountno = accountno;
	}
	public String getCustid() {
		return custid;
	}
	public void setCustid(String custid) {
		this.custid = custid;
	}
	public String getAccounttype() {
		return accounttype;
	}
	public void setAccounttype(String accounttype) {
		this.accounttype = accounttype;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public double getInterest() {
		return interest;
	}
	public void setInterest(double interest) {
		this.interest = interest;
	}
	public String getStartdeposit() {
		return startdeposit;
	}
	public void setStartdeposit(String startdeposit) {
		this.startdeposit = startdeposit;
	}
	public String getEnddeposit() {
		return enddeposit;
	}
	public void setEnddeposit(String enddeposit) {
		this.enddeposit = enddeposit;
	}
	public String getApproval() {
		return approval;
	}
	public void setApproval(String approval) {
		this.approval = approval;
	}
	public String getYears() {
		return years;
	}
	public void setYears(String years) {
		this.years = years;
	}
	@Override
	public String toString() {
		return "Account [accountno=" + accountno + ", custid=" + custid + ", accounttype=" + accounttype + ", balance="
				+ balance + ", payment=" + payment + ", interest=" + interest + ", startdeposit=" + startdeposit
				+ ", enddeposit=" + enddeposit + ", approval=" + approval + ", years=" + years + "]";
	}

}
