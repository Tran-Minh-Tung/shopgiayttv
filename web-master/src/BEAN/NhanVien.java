package BEAN;


public class NhanVien {

	private String MaNhanVien;
	private String HoTen;
	private String SDT;
	private String Email;
	private Quyen Quyen;
	public NhanVien() {}
	public NhanVien(String manv, String ten, String sdt, String mail, Quyen q) {
		this.setMaNhanVien(manv);
		this.setHoTen(ten);
		this.setSDT(sdt);
		this.setEmail(mail);
		this.setQuyen(q);
	}
	
	public String getMaNhanVien() {
		return MaNhanVien;
	}
	public void setMaNhanVien(String maNhanVien) {
		MaNhanVien = maNhanVien;
	}
	public String getHoTen() {
		return HoTen;
	}
	public void setHoTen(String hoTen) {
		HoTen = hoTen;
	}
	public String getSDT() {
		return SDT;
	}
	public void setSDT(String sDT) {
		SDT = sDT;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public Quyen getQuyen() {
		return Quyen;
	}
	public void setQuyen(Quyen quyen) {
		Quyen = quyen;
	}
}
