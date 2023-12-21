package kr.or.ddit.collection;

public class Teacher extends People {

	private String operateType; // 정교사, 기간제
	private String manageType; // 담임교사, 일반교사

	public Teacher() {

	}

	public Teacher(String name, String sex, int age, String operateType, String manageType) {
		this.setName(name);
		this.setSex(sex);
		this.setAge(age);
		this.operateType = operateType;
		this.manageType = manageType;
	}

	public String getOperateType() {
		return operateType;
	}

	public void setOperateType(String operateType) {
		this.operateType = operateType;
	}

	public String getManageType() {
		return manageType;
	}

	public void setManageType(String manageType) {
		this.manageType = manageType;
	}

	@Override
	public String toString() {
		return "Teacher" + super.toString() + " [operateType=" + operateType + ", manageType=" + manageType + "]";
	}

}
