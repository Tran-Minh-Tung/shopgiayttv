package BEAN;

public class TinTuc {

	private int MaTinTuc;
	private String TieuDe;
	private String NoiDung;
	private String HinhAnh;
	public TinTuc() {}
	public TinTuc(int matt, String tieude, String nd, String hinh) {
		this.setMaTinTuc(matt);
		this.setTieuDe(tieude);
		this.setNoiDung(nd);
		this.setHinhAnh(hinh);
	}
	public int getMaTinTuc() {
		return MaTinTuc;
	}
	public void setMaTinTuc(int maTinTuc) {
		MaTinTuc = maTinTuc;
	}
	public String getTieuDe() {
		return TieuDe;
	}
	public void setTieuDe(String tieuDe) {
		TieuDe = tieuDe;
	}
	public String getNoiDung() {
		return NoiDung;
	}
	public void setNoiDung(String noiDung) {
		NoiDung = noiDung;
	}
	public String getHinhAnh() {
		return HinhAnh;
	}
	public void setHinhAnh(String hinhAnh) {
		HinhAnh = hinhAnh;
	}
}
