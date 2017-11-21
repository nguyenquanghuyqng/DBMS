package BEAN;

public class Localhost {

	private String userName;
	private String ip;
	private String database;
	private String password;
	
	public Localhost() {
		
	}
	
	public Localhost(String userName,String ip,String database,String password) {
		this.userName= userName;
		this.ip=ip;
		this.database= database;
		this.password=password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getDatabase() {
		return database;
	}

	public void setDatabase(String database) {
		this.database = database;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
