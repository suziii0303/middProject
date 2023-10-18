package kr.or.ddit.board.vo;

public class NoticePageVO {
	
	private int nStart;
	private int nEnd;
	private int nStartPage;
	private int nEndPage;
	private int nTotalPage;
	private int nCount;
	private static int nPerList = 10;
	private static int nPerPage = 5;
	
	public int getnStart() {
		return nStart;
	}
	public void setnStart(int nStart) {
		this.nStart = nStart;
	}
	public int getnEnd() {
		return nEnd;
	}
	public void setnEnd(int nEnd) {
		this.nEnd = nEnd;
	}
	public int getnStartPage() {
		return nStartPage;
	}
	public void setnStartPage(int nStartPage) {
		this.nStartPage = nStartPage;
	}
	public int getnEndPage() {
		return nEndPage;
	}
	public void setnEndPage(int nEndPage) {
		this.nEndPage = nEndPage;
	}
	public int getnTotalPage() {
		return nTotalPage;
	}
	public void setnTotalPage(int nTotalPage) {
		this.nTotalPage = nTotalPage;
	}
	public int getnCount() {
		return nCount;
	}
	public void setnCount(int nCount) {
		this.nCount = nCount;
	}
	public static int getnPerList() {
		return nPerList;
	}
	public static void setnPerList(int nPerList) {
		NoticePageVO.nPerList = nPerList;
	}
	public static int getnPerPage() {
		return nPerPage;
	}
	public static void setnPerPage(int nPerPage) {
		NoticePageVO.nPerPage = nPerPage;
	}
	
	
}
