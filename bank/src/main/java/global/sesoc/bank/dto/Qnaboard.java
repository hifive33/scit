package global.sesoc.bank.dto;

public class Qnaboard {
	private int boardno;
	private String custid;
	private String title;
	private String content;
	private String regdate;
	private String originalfile;
	private String savedfile;
	private String hitcount;
	private String replytext;
	private String repdate;
	private String notify;
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public String getCustid() {
		return custid;
	}
	public void setCustid(String custid) {
		this.custid = custid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getOriginalfile() {
		return originalfile;
	}
	public void setOriginalfile(String originalfile) {
		this.originalfile = originalfile;
	}
	public String getSavedfile() {
		return savedfile;
	}
	public void setSavedfile(String savedfile) {
		this.savedfile = savedfile;
	}
	public String getHitcount() {
		return hitcount;
	}
	public void setHitcount(String hitcount) {
		this.hitcount = hitcount;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public String getRepdate() {
		return repdate;
	}
	public void setRepdate(String repdate) {
		this.repdate = repdate;
	}
	public String getNotify() {
		return notify;
	}
	public void setNotify(String notify) {
		this.notify = notify;
	}
	@Override
	public String toString() {
		return "Qnaboard [boardno=" + boardno + ", custid=" + custid + ", title=" + title + ", content=" + content
				+ ", regdate=" + regdate + ", originalfile=" + originalfile + ", savedfile=" + savedfile + ", hitcount="
				+ hitcount + ", replytext=" + replytext + ", repdate=" + repdate + ", notify=" + notify + "]";
	}
}
