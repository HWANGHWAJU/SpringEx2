package first.login.model;

public class User {
	private String id;
	private Integer password;
	private String name;

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPassword(Integer string) {
		this.password = string;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getPassword() {
		return password;
	}
	public String getName() {
		return name;
	}
	
	
}
