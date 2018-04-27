package model1;

public class MemberTO {

	private int userIdx;				// User 고유값
	private String AdminID;		// 관리자 아이디
	private String AdminPWD;		// 관리자 패스워드
	private int AdminLevel;		// 관리자 등급
	private String UserID;			// 회원아이디
	private String UserPWD;		// 회원패스워드
	private String NickName;		// 닉네임
	private String Birth;				// 생일자
	private int Sex;					// 성별
	private int JoinType;			// 회원가입 유형 - 일반 : 0 / kakao : 1/ facebook : 2
	private int JoinDate;			// 회원가입날짜
	private int Status;				// 상태 - 정상 : 0 / 차단 - 1
	private int flag;					// 리턴값
	private int icType;				// 중복체크 타입 - 닉네임 : 1 / 아이디 : 2
	private String icValue;			// 중복체크 대상값
	
	public int getUserIdx() {
		return userIdx;
	}
	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}
	public String getAdminID() {
		return AdminID;
	}
	public void setAdminID(String adminID) {
		AdminID = adminID;
	}
	public String getAdminPWD() {
		return AdminPWD;
	}
	public void setAdminPWD(String adminPWD) {
		AdminPWD = adminPWD;
	}
	public int getAdminLevel() {
		return AdminLevel;
	}
	public void setAdminLevel(int adminLevel) {
		AdminLevel = adminLevel;
	}
	public String getUserID() {
		return UserID;
	}
	public void setUserID(String userID) {
		UserID = userID;
	}
	public String getUserPWD() {
		return UserPWD;
	}
	public void setUserPWD(String userPWD) {
		UserPWD = userPWD;
	}
	public String getNickName() {
		return NickName;
	}
	public void setNickName(String nickName) {
		NickName = nickName;
	}
	public String getBirth() {
		return Birth;
	}
	public void setBirth(String birth) {
		Birth = birth;
	}
	public int getSex() {
		return Sex;
	}
	public void setSex(int sex) {
		Sex = sex;
	}
	public int getJoinType() {
		return JoinType;
	}
	public void setJoinType(int joinType) {
		JoinType = joinType;
	}
	public int getJoinDate() {
		return JoinDate;
	}
	public void setJoinDate(int joinDate) {
		JoinDate = joinDate;
	}
	public int getStatus() {
		return Status;
	}
	public void setStatus(int status) {
		Status = status;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public int getIcType() {
		return icType;
	}
	public void setIcType(int icType) {
		this.icType = icType;
	}
	public String getIcValue() {
		return icValue;
	}
	public void setIcValue(String icValue) {
		this.icValue = icValue;
	}
	
}
