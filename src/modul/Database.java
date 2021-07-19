/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modul;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;



//public class Database {
//    public static Connection con;
//    private final static String host = "localhost";
//    private final static String user = "root";
//    private final static String password = "";
//    private final static String db = "db_e-cashier";
//    
//    public static void koneksi(){
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            con = DriverManager.getConnection("jdbc:mysql://"+host+"/"+db,user,password);
//            
//        } catch (Exception e){
//            System.out.println("Gagal Koneksi"+e);
//        }
//    }
//    public static void eksekusi(String sql){
//        try {
//            Statement st = con.createStatement();
//            st.executeUpdate(sql);
//        }catch (Exception e) {
//            System.out.println("Eksekusi SQL gagal :" +e);
//        }
//    }
//    public static ResultSet ambildata (String query){
//        ResultSet rs = null;
//        try {
//            Statement st = con.createStatement();
//            rs = st.executeQuery (query);
//        }catch (Exception e){
//            System.out.println("Eksekusi Query Gagal : " +e);
//        }
//        return rs;
//    }
//}
