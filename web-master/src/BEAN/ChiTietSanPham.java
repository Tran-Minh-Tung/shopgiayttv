package BEAN;

public class ChiTietSanPham {

	private String MaSanPham;
	private int Size;
	private int SoLuong;
	public ChiTietSanPham() {}
	public ChiTietSanPham(String masp, int size, int soluong)
	{
		this.setMaSanPham(masp);
		this.setSize(size);
		this.setSoLuong(soluong);
	}
	public String getMaSanPham() {
		return MaSanPham;
	}
	public void setMaSanPham(String maSanPham) {
		MaSanPham = maSanPham;
	}
	public int getSize() {
		return Size;
	}
	public void setSize(int size) {
		Size = size;
	}
	public int getSoLuong() {
		return SoLuong;
	}
	public void setSoLuong(int soLuong) {
		SoLuong = soLuong;
	}

}
