package BEAN;

public class SanPham implements Comparable<SanPham>{

	private String MaSanPham;
	private String TenSanPham;
	private String MauSac;
	private String GioiTinh;
	private String ThuongHieu;
	private int KhuyenMai;
	private int Gia;
	private int GiaBan;
	private String HinhAnh;
	private String HinhAnh2;
	private String HinhAnh3;
	private String HinhAnh4;
	public SanPham() {}
	public SanPham(String masanpham) {
		this.setMaSanPham(masanpham);
	}
	public SanPham(String masp, String tensp, String mau, String gioitinh, String thuonghieu, int khuyenmai, int gia, String hinh) {
		this.setMaSanPham(masp);
		this.setTenSanPham(tensp);
		this.setMauSac(mau);
		this.setGioiTinh(gioitinh);
		this.setThuongHieu(thuonghieu);
		this.setKhuyenMai(khuyenmai);
		this.setGia(gia);
		this.setGiaBan(gia, khuyenmai);
		this.setHinhAnh(hinh);
		this.setHinhAnh2(hinh);
		this.setHinhAnh3(hinh);
		this.setHinhAnh4(hinh);
	}
	public String getMaSanPham() {
		return MaSanPham;
	}
	public void setMaSanPham(String maSanPham) {
		MaSanPham = maSanPham;
	}
	public String getTenSanPham() {
		return TenSanPham;
	}
	public void setTenSanPham(String tenSanPham) {
		TenSanPham = tenSanPham;
	}
	public String getMauSac() {
		return MauSac;
	}
	public void setMauSac(String mauSac) {
		MauSac = mauSac;
	}
	public String getGioiTinh() {
		return GioiTinh;
	}
	public void setGioiTinh(String gioiTinh) {
		GioiTinh = gioiTinh;
	}
	public String getThuongHieu() {
		return ThuongHieu;
	}
	public void setThuongHieu(String thuongHieu) {
		ThuongHieu = thuongHieu;
	}
	public int getKhuyenMai() {
		return KhuyenMai;
	}
	public void setKhuyenMai(int khuyenMai) {
		KhuyenMai = khuyenMai;
	}
	public int getGia() {
		return (int)Gia;
	}
	public void setGia(int gia) {
		Gia = gia;
	}
	public int getGiaBan() {
		return (int)(this.Gia  - this.Gia*this.KhuyenMai/100);
	}
	public void setGiaBan(int gia, int khuyenmai) {
		GiaBan = gia - gia*khuyenmai/100;
	}
	public String getHinhAnh() {
		return HinhAnh;
	}
	public void setHinhAnh(String hinhAnh) {
		HinhAnh = hinhAnh;
	}
	
	public int compareTo(SanPham sanpham) {
		if(GiaBan==sanpham.getGiaBan()) 
			return 0;
		else if(GiaBan>sanpham.getGiaBan())
			return 1;
		else return -1;
	}
	public String getHinhAnh2() {
		return HinhAnh2;
	}
	public void setHinhAnh2(String hinhanh) {
		String[] array = null;
		if(hinhanh.contains(".jpg"))
		{
			array = hinhanh.split(".jpg");
			HinhAnh2 = array[0]+".2.jpg";
		}
		else if(hinhanh.contains(".png"))
		{
			array = hinhanh.split(".png");
			HinhAnh2 = array[0]+".2.png";
		}
	}
	public String getHinhAnh3() {
		return HinhAnh3;
	}
	public void setHinhAnh3(String hinhanh) {
		String[] array = null;
		if(hinhanh.contains(".jpg"))
		{
			array = hinhanh.split(".jpg");
			HinhAnh3 = array[0]+".3.jpg";
		}
		else if(hinhanh.contains(".png"))
		{
			array = hinhanh.split(".png");
			HinhAnh3 = array[0]+".3.png";
		}
		
	}
	public String getHinhAnh4() {
		return HinhAnh4;
	}
	public void setHinhAnh4(String hinhanh) {
		String[] array = null;
		if(hinhanh.contains(".jpg"))
		{
			array = hinhanh.split(".jpg");
			HinhAnh4 = array[0]+".4.jpg";
		}
		else if(hinhanh.contains(".png"))
		{
			array = hinhanh.split(".png");
			HinhAnh4 = array[0]+".4.png";
		}
	}
}
