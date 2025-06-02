/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.List;

/**
 *
 * @author Admin
 */
public class GoiMonRequest {
    
        private int idBan;
        private List<MonAn> dsMon;

        public int getIdBan() {
            return idBan;
        }

        public void setIdBan(int idBan) {
            this.idBan = idBan;
        }

        public List<MonAn> getDsMon() {
            return dsMon;
        }

        public void setDsMon(List<MonAn> dsMon) {
            this.dsMon = dsMon;
        }
    
        
}
