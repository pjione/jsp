package jdbc;

public class UserDTO {
	private String id;
	private String password;
	private String name;
	private String email;
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
	public String getEmail() {
		return email;
	}

	public String getTs() {
		return ts;
	}
	
	public UserDTO(String id, String password, String name, String email, String ts) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.ts = ts;
	}

	public UserDTO() {
		super();
	}
}
