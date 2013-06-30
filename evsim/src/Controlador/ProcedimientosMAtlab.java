/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Vista.Panel_Principal_1;

import java.io.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

import jxl.*;
import jxl.write.NumberFormat;

import jxl.write.WritableCell;

import jxl.write.WritableCellFormat;

import jxl.write.WritableSheet;

import jxl.write.WritableWorkbook;

/**
 *
 * @author alez
 */
public class ProcedimientosMAtlab {
//Funcion que invoca el ejecutable de matlab 
    public void prcedimiento0var(String ruta) throws IOException{
        
        Runtime r = Runtime.getRuntime();
        try {
            r.exec(ruta);
        } catch (IOException ex) {
            Logger.getLogger(Panel_Principal_1.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void enviaDatosXlsx(String var1){
        File file = new File("C:/Users/alez/Documents/Libro1.xls");
        this.writeExcel(System.getProperty("user.dir")+"/src/Matlab/Libro2.xls", "Hoja1", 1, 1, 10.12);
        
    }
//Funcion  que envia los Double a excel     
    public void writeExcel(String excel_file, String sheet_name, int row, int column, Double value)
    {
        String cellData = new String();
        try{
            Workbook target_workbook = Workbook.getWorkbook(new File(excel_file));
            WritableWorkbook workbook = Workbook.createWorkbook(new File(excel_file), target_workbook);
            target_workbook.close();
            WritableSheet sheet = workbook.getSheet(sheet_name);
            jxl.write.Number number = new jxl.write.Number(column, row, value);
            sheet.addCell(number);
            workbook.write();
            workbook.close();
        }
        catch(Exception e)
        {
            System.out.println("writeExcel ->"+e);
        }
    }
//Funcion  que envia datos string a excel 
      public void writeExcelString(String excel_file, String sheet_name, int row, int column, String value)
    {
        
        try{
            Workbook target_workbook = Workbook.getWorkbook(new File(excel_file));
            WritableWorkbook workbook = Workbook.createWorkbook(new File(excel_file), target_workbook);
            target_workbook.close();
            WritableSheet sheet = workbook.getSheet(sheet_name);
            jxl.write.Label number = new jxl.write.Label(column, row, value);
            sheet.addCell(number);
            workbook.write();
            workbook.close();
        }
        catch(Exception e)
        {
            System.out.println("writeExcel ->"+e);
        }
    }

//Funcion  que envia datos string a excel 
      public void writeExcelInt(String excel_file, String sheet_name, int row, int column, int value)
    {
        
        try{
            Workbook target_workbook = Workbook.getWorkbook(new File(excel_file));
            WritableWorkbook workbook = Workbook.createWorkbook(new File(excel_file), target_workbook);
            target_workbook.close();
            WritableSheet sheet = workbook.getSheet(sheet_name);
            jxl.write.Number number = new jxl.write.Number(column, row, value);
            sheet.addCell(number);
            workbook.write();
            workbook.close();
        }
        catch(Exception e)
        {
            System.out.println("writeExcel ->"+e);
        }
    }


    
    
}
