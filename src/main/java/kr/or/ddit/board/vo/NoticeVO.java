package kr.or.ddit.board.vo;

public class NoticeVO {
	private int no_num    	  ;
	private String mg_id      ;
	private String no_subject ;
	private String no_content ;
	private String no_writer  ;
	private int no_hit    	  ;
	private String no_date    ;
	
	public int getNo_num() {
		return no_num;
	}
	public void setNo_num(int no_num) {
		this.no_num = no_num;
	}
	public String getMg_id() {
		return mg_id;
	}
	public void setMg_id(String mg_id) {
		this.mg_id = mg_id;
	}
	public String getNo_subject() {
		return no_subject;
	}
	public void setNo_subject(String no_subject) {
		this.no_subject = no_subject;
	}
	public String getNo_content() {
		return no_content;
	}
	public void setNo_content(String no_content) {
		this.no_content = no_content;
	}
	public String getNo_writer() {
		return no_writer;
	}
	public void setNo_writer(String no_writer) {
		this.no_writer = no_writer;
	}
	public int getNo_hit() {
		return no_hit;
	}
	public void setNo_hit(int no_hit) {
		this.no_hit = no_hit;
	}
	public String getNo_date() {
		return no_date;
	}
	public void setNo_date(String no_date) {
		this.no_date = no_date;
	}
	@Override
	public String toString() {
		return "NoticeVO [no_num=" + no_num + ", mg_id=" + mg_id + ", no_subject=" + no_subject + ", no_content="
				+ no_content + ", no_writer=" + no_writer + ", no_hit=" + no_hit + ", no_date=" + no_date + "]";
	}

	
}
