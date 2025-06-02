/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author FPT
 */
public class Ban {
        private int idBan;
    private String tenBan;
    private String vitri;
    private String trangthai;

    public Ban() {
    }

    public Ban(int idBan, String tenBan, String vitri, String trangthai) {
        this.idBan = idBan;
        this.tenBan = tenBan;
        this.vitri = vitri;
        this.trangthai = trangthai;
    }

    public int getIdBan() {
        return idBan;
    }

    public void setIdBan(int idBan) {
        this.idBan = idBan;
    }

    public String getTenBan() {
        return tenBan;
    }

    public void setTenBan(String tenBan) {
        this.tenBan = tenBan;
    }

    public String getVitri() {
        return vitri;
    }

    public void setVitri(String vitri) {
        this.vitri = vitri;
    }

    public String getTrangthai() {
        return trangthai;
    }

    public void setTrangthai(String trangthai) {
        this.trangthai = trangthai;
    }

    @Override
    public String toString() {
        return "Ban{" + "idBan=" + idBan + ", tenBan=" + tenBan + ", vitri=" + vitri + ", trangthai=" + trangthai + '}';
    }
    
}
