package entity;

public class CartItem {
    private int id;
    private int userId;      // tương ứng ID_ND
    private MonAn monAn;
    private int soLuong;

    public CartItem() {
    }

    public CartItem(int id, int userId, MonAn monAn, int soLuong) {
        this.id = id;
        this.userId = userId;
        this.monAn = monAn;
        this.soLuong = soLuong;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public MonAn getMonAn() {
        return monAn;
    }

    public void setMonAn(MonAn monAn) {
        this.monAn = monAn;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    
}
