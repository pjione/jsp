package jdbc;

public class UserDTO {
	private String id;
	private String password;
	private String name;
	private String ts;
	
	public String getId() {
		return id;
	}

	public String getPassword() {
		return password;
	}

	public String getName() {
		return name;
	}

	public String getTs() {
		return ts;
	}

	public UserDTO(String id, String password, String name, String ts) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.ts = ts;
	}

	public UserDTO() {
		super();
	}
}
