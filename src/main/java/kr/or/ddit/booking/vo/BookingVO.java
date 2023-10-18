package kr.or.ddit.booking.vo;
//상영정보 조회를 위해 임의로 만든 booking
// 영화 번호가 ~면서 ~지점에 해당하는 상영정보를 조회하기 위함~!
public class BookingVO {
	private String m_id;	//영화 번호
	private String cn_id;	//영화관 id
	private String t_date;  //선택 날짜
	private String th_id;	//상영관id
	
	
	public String getTh_id() {
		return th_id;
	}
	public void setTh_id(String th_id) {
		this.th_id = th_id;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getCn_id() {
		return cn_id;
	}
	public void setCn_id(String cn_id) {
		this.cn_id = cn_id;
	}
	
	public String getT_date() {
		return t_date;
	}
	public void setT_date(String t_date) {
		this.t_date = t_date;
	}
	
	
}
