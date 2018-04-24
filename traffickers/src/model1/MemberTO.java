package model1;

public class MemberTO {

	private int userIdx;
	private String AdminID;
	private String AdminPWD;
	private int AdminLevel;
	private String UserID;
	private String UserPWD;
	private String NickName;
	private int Birth;
	private int Sex;
	private int JoinType;
	private int JoinDate;
	private int Status;	
	private int flag;	
	
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
	public int getBirth() {
		return Birth;
	}
	public void setBirth(int birth) {
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
}
