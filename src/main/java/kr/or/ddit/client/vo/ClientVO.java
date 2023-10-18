package kr.or.ddit.client.vo;

public class ClientVO {

	private String au_num  ;
	private String c_isdelete;
	private String c_id    ;
	private String c_nm    ;
	private String c_pass  ;
	private String c_tel   ;
	private String c_email ;
	private String c_bir   ;
	private String c_add   ;
	private String c_gend  ;
	
	
	public String getAu_num() {
		return au_num;
	}
	public void setAu_num(String au_num) {
		this.au_num = au_num;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public String getC_nm() {
		return c_nm;
	}
	public void setC_nm(String c_nm) {
		this.c_nm = c_nm;
	}
	public String getC_pass() {
		return c_pass;
	}
	public void setC_pass(String c_pass) {
		this.c_pass = c_pass;
	}
	public String getC_tel() {
		return c_tel;
	}
	public void setC_tel(String c_tel) {
		this.c_tel = c_tel;
	}
	public String getC_email() {
		return c_email;
	}
	public void setC_email(String c_email) {
		this.c_email = c_email;
	}
	public String getC_bir() {
		return c_bir;
	}
	public void setC_bir(String c_bir) {
		this.c_bir = c_bir;
	}
	public String getC_add() {
		return c_add;
	}
	public void setC_add(String c_add) {
		this.c_add = c_add;
	}
	public String getC_gend() {
		return c_gend;
	}
	public void setC_gend(String c_gend) {
		this.c_gend = c_gend;
	}
	@Override
	public String toString() {
		return "ClientVO [au_num=" + au_num + ", c_id=" + c_id + ", c_nm=" + c_nm + ", c_pass=" + c_pass + ", c_tel="
				+ c_tel + ", c_email=" + c_email + ", c_bir=" + c_bir + ", c_add=" + c_add + ", c_gend=" + c_gend + "]";
	}
	public String getC_isdelete() {
		return c_isdelete;
	}
	public void setC_isdelete(String c_isdelete) {
		this.c_isdelete = c_isdelete;
	}
	
	
}
