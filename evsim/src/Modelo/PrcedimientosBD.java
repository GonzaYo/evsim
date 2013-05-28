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
import java.io.File;
/**
 *
 * @author alez
 */
public class PrcedimientosBD {
    Connection conn = null;
    
   public int InsertarVehiculo(String Tipologia, String DescripcionVehiculo) throws Exception
   {    int resultado = 0;

       try { 
            conn = ConexionMySQL.conectar();
            conn.setAutoCommit(true);
       
            // se crea instancia a procedimiento, los parametros de entrada y salida se simbolizan con el signo ?
            CallableStatement proc = conn.prepareCall(" {CALL InsertarVehiculo(?,?,?)} ");
            //se cargan los parametros de entrada
            proc.setString("Tipologia", Tipologia);
            proc.setString("DescripcionVehiculo", DescripcionVehiculo);

            // parametros de salida
            proc.registerOutParameter("id", Types.INTEGER);
            // Se ejecuta el procedimiento almacenado
            proc.execute();            
            // devuelve el valor del parametro de salida del procedimiento
            resultado = proc.getInt("id");
            conn.close();
            
        } 
       catch (Exception e) {                  
            System.out.println(e);
       }
        
      return resultado; 
   }
     public void InsertarGrafica(int idGrafica,int idVehiculo,int idEstrato,String Porcentaje) throws Exception
   {    

       try { 
            conn = ConexionMySQL.conectar();
            conn.setAutoCommit(true);
       
            // se crea instancia a procedimiento, los parametros de entrada y salida se simbolizan con el signo ?
            CallableStatement proc = conn.prepareCall(" {CALL InsertarGrafica(?,?,?,?)} ");
            //se cargan los parametros de entrada
            proc.setInt("idGrafica", idGrafica);
            proc.setInt("idVehiculo", idVehiculo);
            proc.setString("Porcentaje", Porcentaje);
            proc.setInt("idEstrato", idEstrato);
            
            
            // parametros de salida
           
            // Se ejecuta el procedimiento almacenado
            proc.execute();            
            // devuelve el valor del parametro de salida del procedimiento
            
            conn.close();
            
        } 
       catch (Exception e) {                  
            System.out.println(e);
       }
        
      
   }
      public int RecuperarDatos(String Tipologia, String DescripcionVehiculo) throws Exception
   {    int resultado = 0;

       try { 
            conn = ConexionMySQL.conectar();
            conn.setAutoCommit(true);
       
            // se crea instancia a procedimiento, los parametros de entrada y salida se simbolizan con el signo ?
            CallableStatement proc = conn.prepareCall(" {CALL InsertarVehiculo(?,?,?)} ");
            //se cargan los parametros de entrada
            proc.setString("Tipologia", Tipologia);
            proc.setString("DescripcionVehiculo", DescripcionVehiculo);

            // parametros de salida
            proc.registerOutParameter("id", Types.INTEGER);
            // Se ejecuta el procedimiento almacenado
            proc.execute();            
            // devuelve el valor del parametro de salida del procedimiento
            resultado = proc.getInt("id");
            conn.close();
            
        } 
       catch (Exception e) {                  
            System.out.println(e);
       }
        
      return resultado; 
   }
      private Statement Query;
    
    public void ImportarDatosMatlab() {
        //este prcedimiento sirve para cargar los datos en la bd que registran las aplicaciones hechas en matlab
         try { 
            conn = ConexionMySQL.conectar();
            conn.setAutoCommit(true);
            Query=conn.createStatement();
            Query.execute("truncate table ExcelTemp");
            Query.execute("LOAD DATA INFILE 'C://Users//alez//Dropbox//TPI//evsimDatosMatlab.csv'INTO TABLE ExcelTemp FIELDS TERMINATED BY ';' LINES TERMINATED BY '\r\n' iGNORE 1 LINES");
            
         }
         catch (Exception e) {                  
            System.out.println(e);
       }
    }
    public void ExportarDatosJAVA() {
        //este prcedimiento sirve para exportarlos datos de java al excel C://Users//alez//Dropbox//TPI//evsimDatosJAVA.csv
         try { 
            conn = ConexionMySQL.conectar();
            conn.setAutoCommit(true);
            Query=conn.createStatement();
            File fichero = new File("C:/Users/alez/Dropbox/TPI/evsimDatosJAVA.csv");
            if (!fichero.delete())
		throw new Exception("El fichero " + "C:/Users/alez/Dropbox/TPI/evsimDatosJAVA.csv"+ " no puede ser borrado!");
            else
                Query.execute("SELECT * INTO OUTFILE 'C://Users//alez//Dropbox//TPI//evsimDatosJAVA.csv' FIELDS TERMINATED BY ';' FROM vehiculo;");
           }
         
         catch (Exception e) {                  
            System.out.println(e);
       }
    }
}

/*
 * 
 DELIMITER $
CREATE PROCEDURE registrar_jugador(IN nombre varchar(60) ,
                                   IN anio_nac INT,
                                   OUT resultado TEXT)
BEGIN
DECLARE edad int ;
DECLARE categoria char(20) ;
-- obtiene la edad del jugador
SET edad = ( DATE_FORMAT(now() ,'%Y') - anio_nac );
-- dependiendo de la edad se registra al jugador en diferentes categorias
     CASE
        WHEN edad=18 OR edad=19 OR edad=20 THEN SET categoria = 'Sub 20'  ;
        WHEN edad=21 OR edad=22 OR edad=23 THEN SET categoria = 'Sub 22'  ;
        ELSE SET categoria = 'Sin categoria';
     END CASE ;
     INSERT INTO jugador(nombre, anio_nac, categoria) VALUES( nombre, anio_nac , categoria );
-- Cuando se termina de registrar al jugador, se devuelve una respuesta en formato de texto
     SET resultado = CONCAT( 'Jugador ', nombre, ' de ' , edad , ' años registrado en categoria [' , categoria, ']' );
END $
DELIMITER ; 
  
  
  
 */