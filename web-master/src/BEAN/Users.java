package BEAN;

public class Users {

	private String id;
	private String pass;
	private int quyen;
	public Users() {	}
	public Users(String id, String pass, int quyen) {
		this.setId(id);
		this.setPass(pass);
		this.setQuyen(quyen);
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getQuyen() {
		return quyen;
	}
	public void setQuyen(int quyen) {
		this.quyen = quyen;
	}
}
