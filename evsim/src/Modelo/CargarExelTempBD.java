/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;
import java.sql.CallableStatement;
import Modelo.TestConnection;
import java.sql.Connection;
import java.sql.Types;
import Modelo.ConexionMySQL;
import java.sql.Statement;

/**
 *
 * @author alez
 */
 
public class CargarExelTempBD {
    private Statement Query;
    Connection conn = null;
    public CargarExelTempBD() {
         try { 
            conn = ConexionMySQL.conectar();
            conn.setAutoCommit(true);
            Query=conn.createStatement();
            Query.execute("LOAD DATA INFILE 'C://Users//alez//Dropbox//TPI//evsimDatos.csv'INTO TABLE ExcelTempFIELDS TERMINATED BY ';' LINES TERMINATED BY '\r\n'iGNORE 1 LINES");
            
         }
         catch (Exception e) {                  
            System.out.println(e);
       }
    }
    
}
