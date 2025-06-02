package entity;

public class LoaiMon {
    private int ID_Loai;
    private String TenLoai;

    public LoaiMon() {
    }

    public LoaiMon(int ID_Loai, String TenLoai) {
        this.ID_Loai = ID_Loai;
        this.TenLoai = TenLoai;
    }

    public int getID_Loai() {
        return ID_Loai;
    }

    public void setID_Loai(int ID_Loai) {
        this.ID_Loai = ID_Loai;
    }

    public String getTenLoai() {         // PHẢI CÓ dòng này!
        return TenLoai;
    }

    public void setTenLoai(String TenLoai) {
        this.TenLoai = TenLoai;
    }
}
