package BEAN;

public class Quyen {

	private int MaQuyen;
	private int Admin;
	private int KhachHang;
	private int SanPham;
	private int DonHang;
	private int TinTuc;
	private String MieuTa;
	public Quyen() {}
	public Quyen(int maquyen) {
		this.setMaQuyen(maquyen);
	}
	public Quyen(int maquyen, int ad, int kh, int sp, int dh, int tt, String mieuta) {
		this.setMaQuyen(maquyen);
		this.setAdmin(ad);
		this.setKhachHang(kh);
		this.setSanPham(sp);
		this.setDonHang(dh);
		this.setTinTuc(tt);
		this.setMieuTa(mieuta);
	}
	public int getMaQuyen() {
		return MaQuyen;
	}
	public void setMaQuyen(int maQuyen) {
		MaQuyen = maQuyen;
	}
	public int getAdmin() {
		return Admin;
	}
	public void setAdmin(int admin) {
		Admin = admin;
	}
	public int getKhachHang() {
		return KhachHang;
	}
	public void setKhachHang(int khachHang) {
		KhachHang = khachHang;
	}
	public int getSanPham() {
		return SanPham;
	}
	public void setSanPham(int sanPham) {
		SanPham = sanPham;
	}
	public int getDonHang() {
		return DonHang;
	}
	public void setDonHang(int donHang) {
		DonHang = donHang;
	}
	public int getTinTuc() {
		return TinTuc;
	}
	public void setTinTuc(int tinTuc) {
		TinTuc = tinTuc;
	}
	public String getMieuTa() {
		return MieuTa;
	}
	public void setMieuTa(String mieuTa) {
		MieuTa = mieuTa;
	}
}
