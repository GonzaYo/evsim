/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author alez
 */
import java.sql.*;
public class TestConnection {
public String bd = "simev";
public String login = "root";
public String password = "";
public String url = "jdbc:mysql://localhost/"+bd;
Connection conn = null;
public void conectar() {

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, login, password);
        if (conn != null)
    {
    System.out.println("Conexión a base de datos "+url+" ... Ok");
    conn.close();
    }
    }
    catch(SQLException ex) {
        System.out.println("Hubo un problema al intentar conectarse con la base de datos "+url);
    }
    catch(ClassNotFoundException ex) {
        System.out.println(ex);
    }
    }
}
/*
  TestConnection conexion = new TestConnection();
  conexion.conectar();
  
  
  
 */