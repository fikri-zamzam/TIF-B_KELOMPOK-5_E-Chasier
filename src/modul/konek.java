/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modul;

import com.mysql.jdbc.Driver;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;

public class konek {
    private static Connection koneksi;
    
      public static Connection GetConnection()throws SQLException{
          if (koneksi == null){
              new Driver();
              
              koneksi = DriverManager.getConnection("jdbc:mysql://localhost:3306/"
                      + "db_e-cashier","root","");
          }
          return koneksi;
      }
}
