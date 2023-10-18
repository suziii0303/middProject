package kr.or.ddit.board.vo;

public class ReplyVO {
	private int r_num         ;
	private int q_num    	  ;
	private String mg_id      ;
	private String r_content  ;
	private String r_date     ;
	
	
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public int getQ_num() {
		return q_num;
	}
	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}
	public String getMg_id() {
		return mg_id;
	}
	public void setMg_id(String mg_id) {
		this.mg_id = mg_id;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [r_num=" + r_num + ", q_num=" + q_num + ", mg_id=" + mg_id + ", r_content=" + r_content
				+ ", r_date=" + r_date + "]";
	}
	
	
	
}
