/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Connection;

/**
 *
 * @author alez
 */
class ConexionMySQL {
 
	public static Connection con_mysql;
        public static String pDataBase = "simev";
        public static String pUser = "root";
        public static String pPassword = "";
        public static Connection conectar() throws Exception {
		try {
			String databaseURL = "jdbc:mysql://localhost/"+ pDataBase;
			Class.forName("com.mysql.jdbc.Driver");
			con_mysql = java.sql.DriverManager.getConnection(databaseURL, pUser, pPassword);
			//System.out.println("Conexion con MySQL Establecida..");
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return con_mysql;
	}
}