/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

import java.sql.*;


public class DBContext {
   private static final String url = "jdbc:sqlserver://localhost:1433;databaseName=dbQUANLYNHAHANG;encrypt=true;trustServerCertificate=true";
    private static final String user = "sa";
    private static final String password ="12345";

    public static Connection getConnection() throws SQLException{
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            return DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException e) {
            throw new SQLException("SQL Server JDBC Driver not found.", e);
        }
    }
    public static void main(String[] args) {
        try {
               System.out.println(new DBContext().getConnection());
        } catch (Exception e) {
        }
    }
}
