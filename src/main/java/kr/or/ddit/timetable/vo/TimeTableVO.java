package kr.or.ddit.timetable.vo;

public class TimeTableVO {
	private int t_num     ;
	private String th_id  ;
	private String t_date ;
	private String t_time ;
	private String m_subject;
	
	
	public int getT_num() {
		return t_num;
	}
	public void setT_num(int t_num) {
		this.t_num = t_num;
	}
	public String getTh_id() {
		return th_id;
	}
	public void setTh_id(String th_id) {
		this.th_id = th_id;
	}
	public String getT_date() {
		return t_date;
	}
	public void setT_date(String t_date) {
		this.t_date = t_date;
	}
	public String getT_time() {
		return t_time;
	}
	public void setT_time(String t_time) {
		this.t_time = t_time;
	}
	public String getM_subject() {
		return m_subject;
	}
	public void setM_subject(String m_subject) {
		this.m_subject = m_subject;
	}
	
}
