package model1;

public class ConcertTO {
	private int cidx;					// 콘서트 고유값
	private int ctype;				// 콘서트 - 0, 인디 - 1
	private int mem_idx;			// 회원 idx
	private String user_id;			// 회원 아이디
	private int view_yn;			// 대기 - 0, 승인 - 1, 보류 - 2
	private int view_level;			// 1 ~ 10 메인 노출
	private String subject;			// 제목
	private String contents;		// 내용
	private String ctime;			// 공연시간
	private String cDate;			// 공연날짜
	private String cprice;			// 금액
	private String cplace;			// 장소
	private String clink;				// 공연 홈페이지
	private String curl;				// 예매 사이트
	private String cetc;				// 기타 사항
	private String posterName;	// 포스트 이미지 네임
	private String posterData;	// 포스트 이미지 변경 파일네임
	private long posterSize;		// 포스트 이미지 사이즈
	private String wdate;			// 등록시간
		
	public int getCidx() {
		return cidx;
	}
	public void setCidx(int cidx) {
		this.cidx = cidx;
	}	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getCtype() {
		return ctype;
	}
	public void setCtype(int ctype) {
		this.ctype = ctype;
	}
	public int getMem_idx() {
		return mem_idx;
	}
	public void setMem_idx(int mem_idx) {
		this.mem_idx = mem_idx;
	}
	public int getView_yn() {
		return view_yn;
	}
	public void setView_yn(int view_yn) {
		this.view_yn = view_yn;
	}
	public int getView_level() {
		return view_level;
	}
	public void setView_level(int view_level) {
		this.view_level = view_level;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getCtime() {
		return ctime;
	}
	public void setCtime(String ctime) {
		this.ctime = ctime;
	}	
	public String getcDate() {
		return cDate;
	}
	public void setcDate(String cDate) {
		this.cDate = cDate;
	}
	public String getCprice() {
		return cprice;
	}
	public void setCprice(String cprice) {
		this.cprice = cprice;
	}
	public String getCplace() {
		return cplace;
	}
	public void setCplace(String cplace) {
		this.cplace = cplace;
	}
	public String getClink() {
		return clink;
	}
	public void setClink(String clink) {
		this.clink = clink;
	}
	public String getCurl() {
		return curl;
	}
	public void setCurl(String curl) {
		this.curl = curl;
	}
	public String getCetc() {
		return cetc;
	}
	public void setCetc(String cetc) {
		this.cetc = cetc;
	}
	public String getPosterName() {
		return posterName;
	}
	public void setPosterName(String posterName) {
		this.posterName = posterName;
	}
	public String getPosterData() {
		return posterData;
	}
	public void setPosterData(String posterData) {
		this.posterData = posterData;
	}
	public long getPosterSize() {
		return posterSize;
	}
	public void setPosterSize(long posterSize) {
		this.posterSize = posterSize;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
}
