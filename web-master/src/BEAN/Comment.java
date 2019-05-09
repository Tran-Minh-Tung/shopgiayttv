package BEAN;

public class Comment {
	
	private String MaComment;
	private String MaSanPham;
	private String MaKhachHang;
	private String NoiDung;
	public Comment() {}
	public Comment(String macm, String masp, String makh, String nd) {
		this.setMaComment(macm);
		this.setMaSanPham(masp);
		this.setMaKhachHang(makh);
		this.setNoiDung(nd);
	}
	public Comment(String masp, String makh, String nd) {
		this.setRandomString();
		this.setMaSanPham(masp);
		this.setMaKhachHang(makh);
		this.setNoiDung(nd);
	}
	public String getMaComment() {
		return MaComment;
	}
	public void setMaComment(String maComment) {
		MaComment = maComment;
	}
	public String getMaSanPham() {
		return MaSanPham;
	}
	public void setMaSanPham(String maSanPham) {
		MaSanPham = maSanPham;
	}
	public String getMaKhachHang() {
		return MaKhachHang;
	}
	public void setMaKhachHang(String maKhachHang) {
		MaKhachHang = maKhachHang;
	}
	public String getNoiDung() {
		return NoiDung;
	}
	public void setNoiDung(String noiDung) {
		NoiDung = noiDung;
	}
	public void setRandomString() 
	{
		MaComment="";
		String chuoi = "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm1234567890";
		int max = (int)(Math.random()*40);
		while(max==0 || max>40)
			max=(int)(Math.random()*40);
		for(int i=0;i<max;i++) {
			int temp=(int)(Math.round(Math.random() * (chuoi.length()-1)));
			MaComment += chuoi.charAt(temp); 
		}
	}
}
