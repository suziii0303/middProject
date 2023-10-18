package kr.or.ddit.movie.vo;

public class MovieVO {
	private String m_id         ;
	private int mr_id           ;
	private String mg_id        ;
	private String m_subject    ;
	private String m_post       ;
	private String m_plot       ;
	private String m_director   ;
	private String m_date       ;
	private String m_actor      ;
	private String m_runtime    ;
	private String m_genre      ;
	private String m_isdelete   ;
	private int total_qty;
	
	

	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getMr_id() {
		return mr_id;
	}
	public void setMr_id(int mr_id) {
		this.mr_id = mr_id;
	}
	public String getMg_id() {
		return mg_id;
	}
	public void setMg_id(String mg_id) {
		this.mg_id = mg_id;
	}
	public String getM_subject() {
		return m_subject;
	}
	public void setM_subject(String m_subject) {
		this.m_subject = m_subject;
	}
	public String getM_post() {
		return m_post;
	}
	public void setM_post(String m_post) {
		this.m_post = m_post;
	}
	public String getM_plot() {
		return m_plot;
	}
	public void setM_plot(String m_plot) {
		this.m_plot = m_plot;
	}
	public String getM_director() {
		return m_director;
	}
	public void setM_director(String m_director) {
		this.m_director = m_director;
	}
	public String getM_date() {
		return m_date;
	}
	public void setM_date(String m_date) {
		this.m_date = m_date;
	}
	public String getM_actor() {
		return m_actor;
	}
	public void setM_actor(String m_actor) {
		this.m_actor = m_actor;
	}
	public String getM_runtime() {
		return m_runtime;
	}
	public void setM_runtime(String m_runtime) {
		this.m_runtime = m_runtime;
	}
	public String getM_genre() {
		return m_genre;
	}
	public void setM_genre(String m_genre) {
		this.m_genre = m_genre;
	}
	
	public String getM_isdelete() {
		return m_isdelete;
	}
	public void setM_isdelete(String m_isdelete) {
		this.m_isdelete = m_isdelete;
	}
	
	
	
	
	public int getTotal_qty() {
		return total_qty;
	}
	public void setTotal_qty(int total_qty) {
		this.total_qty = total_qty;
	}
	@Override
	public String toString() {
		return "MovieVO [m_id=" + m_id + ", mr_id=" + mr_id + ", mg_id=" + mg_id + ", m_subject=" + m_subject
				+ ", m_post=" + m_post + ", m_plot=" + m_plot + ", m_director=" + m_director + ", m_date=" + m_date
				+ ", m_actor=" + m_actor + ", m_runtime=" + m_runtime + ", m_genre=" + m_genre + ", m_isdelete="
				+ m_isdelete + "]";
	}
	

	
}
