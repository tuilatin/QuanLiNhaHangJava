/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author FPT
 */
public class NguoiDung {
    private int id;
    private String email;
    private String matkhau;
    private String verifyCode;
    private String trangthai;
    private String vaitro;
    private String tenND;

    public NguoiDung() {
    }

 

    public NguoiDung(int id, String email, String matkhau, String verifyCode, String trangthai, String vaitro, String tenND) {
        this.id = id;
        this.email = email;
        this.matkhau = matkhau;
        this.verifyCode = verifyCode;
        this.trangthai = trangthai;
        this.vaitro = vaitro;
        this.tenND = tenND;
    }

    public String getTenND() {
        return tenND;
    }

    public void setTenND(String tenND) {
        this.tenND = tenND;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMatkhau() {
        return matkhau;
    }

    public void setMatkhau(String matkhau) {
        this.matkhau = matkhau;
    }

    public String getVerifyCode() {
        return verifyCode;
    }

    public void setVerifyCode(String verifyCode) {
        this.verifyCode = verifyCode;
    }

    public String getTrangthai() {
        return trangthai;
    }

    public void setTrangthai(String trangthai) {
        this.trangthai = trangthai;
    }

    public String getVaitro() {
        return vaitro;
    }

    public void setVaitro(String vaitro) {
        this.vaitro = vaitro;
    }

    @Override
    public String toString() {
        return "NguoiDung{" + "id=" + id + ", email=" + email + ", matkhau=" + matkhau + ", verifyCode=" + verifyCode + ", trangthai=" + trangthai + ", vaitro=" + vaitro + ", tenND=" + tenND + '}';
    }
    
}
