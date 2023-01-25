package jdbc;

public class UserDTO {
	private String to;
	private String pass;
	private String name;
	private String content;
	public UserDTO(String to, String pass, String name, String content) {
		super();
		this.to = to;
		this.pass = pass;
		this.name = name;
		this.content = content;
	}
	public String getTo() {
		return to;
	}
	public String getPass() {
		return pass;
	}
	public String getName() {
		return name;
	}
	public String getContent() {
		return content;
	}
	
	
}
