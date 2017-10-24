package entity;

public class User {
	private String id = "";
	private String name = "";
	private String password = "";
	private int type = 0; // 1:管理员，2：教师，3：学生

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
	
	@Override
	public String toString() {
		return "User[id=" + id + ", type=" + type + ", name=" + name;
	}
}
