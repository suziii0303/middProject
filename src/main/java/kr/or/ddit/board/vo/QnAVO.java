package kr.or.ddit.board.vo;

public class QnAVO {
	private int q_num      	   ;
	private String c_id      ;
	private String q_writer    ;
	private String q_subject   ;
	private String q_content   ;
	private String q_date      ;
	private int r_count;
	
	public int getQ_num() {
		return q_num;
	}
	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public String getQ_writer() {
		return q_writer;
	}
	public void setQ_writer(String q_writer) {
		this.q_writer = q_writer;
	}
	public String getQ_subject() {
		return q_subject;
	}
	public void setQ_subject(String q_subject) {
		this.q_subject = q_subject;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getQ_date() {
		return q_date;
	}
	public void setQ_date(String q_date) {
		this.q_date = q_date;
	}
	public int getR_count() {
		return r_count;
	}
	public void setR_count(int r_count) {
		this.r_count = r_count;
	}
	
	@Override
	public String toString() {
		return "QnAVO [q_num=" + q_num + ", c_id=" + c_id + ", q_writer=" + q_writer + ", q_subject=" + q_subject
				+ ", q_content=" + q_content + ", q_date=" + q_date + ", r_count=" + r_count + "]";
	}
	
}
