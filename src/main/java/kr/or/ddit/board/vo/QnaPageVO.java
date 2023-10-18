package kr.or.ddit.board.vo;

public class QnaPageVO {

	private int qStart;
	private int qEnd;
	private int qStartPage;
	private int qEndPage;
	private int qTotalPage;
	private int qCount;
	private static int qPerList = 10;
	private static int qPerPage = 5;
	
	public int getqStart() {
		return qStart;
	}
	public void setqStart(int qStart) {
		this.qStart = qStart;
	}
	public int getqEnd() {
		return qEnd;
	}
	public void setqEnd(int qEnd) {
		this.qEnd = qEnd;
	}
	public int getqStartPage() {
		return qStartPage;
	}
	public void setqStartPage(int qStartPage) {
		this.qStartPage = qStartPage;
	}
	public int getqEndPage() {
		return qEndPage;
	}
	public void setqEndPage(int qEndPage) {
		this.qEndPage = qEndPage;
	}
	public int getqTotalPage() {
		return qTotalPage;
	}
	public void setqTotalPage(int qTotalPage) {
		this.qTotalPage = qTotalPage;
	}
	public int getqCount() {
		return qCount;
	}
	public void setqCount(int qCount) {
		this.qCount = qCount;
	}
	public static int getqPerList() {
		return qPerList;
	}
	public static void setqPerList(int qPerList) {
		QnaPageVO.qPerList = qPerList;
	}
	public static int getqPerPage() {
		return qPerPage;
	}
	public static void setqPerPage(int qPerPage) {
		QnaPageVO.qPerPage = qPerPage;
	}
	@Override
	public String toString() {
		return "QnaPageVO [qStart=" + qStart + ", qEnd=" + qEnd + ", qStartPage=" + qStartPage + ", qEndPage="
				+ qEndPage + ", qTotalPage=" + qTotalPage + ", qCount=" + qCount + "]";
	}
	
	
	
}
