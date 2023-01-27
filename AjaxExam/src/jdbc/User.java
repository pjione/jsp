package jdbc;

public class User {
	private String userName;
	private int userAge;
	private String userGender;
	private String userEmail;
	public String getUserName() {
		return userName;
	}
	public int getUserAge() {
		return userAge;
	}
	public String getUserGender() {
		return userGender;
	}
	public String getUserEmail() {
		return userEmail;
	}
	
	public User(String userName, int userAge, String userGender, String userEmail) {
		super();
		this.userName = userName;
		this.userAge = userAge;
		this.userGender = userGender;
		this.userEmail = userEmail;
	}
	
	
}
