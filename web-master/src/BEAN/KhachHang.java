package BEAN;

public class KhachHang {

	private String MaKhachHang;
	private String HoTen;
	private String Email;
	private String SoDienThoai;
	private String DiaChi;
	public KhachHang() {}
	public KhachHang(String MKH, String hoten, String email, String sdt, String diachi) {
		this.setMaKhachHang(MKH);
		this.setHoTen(hoten);
		this.setEmail(email);
		this.setSoDienThoai(sdt);
		this.setDiaChi(diachi);
	}
	public String getMaKhachHang() {
		return MaKhachHang;
	}
	public void setMaKhachHang(String maKhachHang) {
		MaKhachHang = maKhachHang;
	}
	public String getHoTen() {
		return HoTen;
	}
	public void setHoTen(String hoTen) {
		HoTen = hoTen;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getSoDienThoai() {
		return SoDienThoai;
	}
	public void setSoDienThoai(String soDienThoai) {
		SoDienThoai = soDienThoai;
	}
	public String getDiaChi() {
		return DiaChi;
	}
	public void setDiaChi(String diaChi) {
		DiaChi = diaChi;
	}
}
