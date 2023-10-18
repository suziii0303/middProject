package kr.or.ddit.seat.vo;

public class SeatVO {
	private int s_id    ;
	private String th_id   ;
	private int sr_num     ;
	private String s_ok;
	private String s_nm;
	
	public String getS_ok() {
		return s_ok;
	}
	public void setS_ok(String s_ok) {
		this.s_ok = s_ok;
	}
	public String getS_nm() {
		return s_nm;
	}
	public void setS_nm(String s_nm) {
		this.s_nm = s_nm;
	}
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public String getTh_id() {
		return th_id;
	}
	public void setTh_id(String th_id) {
		this.th_id = th_id;
	}
	public int getSr_num() {
		return sr_num;
	}
	public void setSr_num(int sr_num) {
		this.sr_num = sr_num;
	}
	
	
}
