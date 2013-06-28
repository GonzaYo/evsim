/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * package Controlador;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import model.entities.ResultadoDeCalculo;

import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

 * @author alez
 */
public class WriteExcel {
        /*XSSFWorkbook libro = new XSSFWorkbook();
        Sheet hoja = libro.createSheet();       
        List<ResultadoDeCalculo> resultado;
        public WriteExcel() {
                super();
        }
        
        public WriteExcel(List<ResultadoDeCalculo> resultado) {
                super();
                this.resultado = resultado;
        }

        public void write(){
                this.crearFilaTitulo();
                if(resultado.size()>=1){
                        for (int i = 1; i <= resultado.size(); i++) {
                                Row fila = hoja.createRow(i);
                                ResultadoDeCalculo r = resultado.get(i-1);
                                new String("" + r.getCUIL() + "");
                                //Celdas con los contenidos de resultado
                                this.crearCelda(0,r.getCUIL() , fila);
                                this.crearCelda(1,r.getNom_y_ape(), fila);
                                this.crearCelda(2,(double) r.getRNIF() , fila);
                                this.crearCelda(3,(double) r.getGananciaA(), fila);
                                this.crearCelda(4,(double) r.getGananciaB(), fila);
                                this.crearCelda(5,(double) r.getGananciaC(), fila);
                                this.crearCelda(6,(double) r.getImp_ganan_periodo(), fila);
                                this.crearCelda(7,(double) r.getImp_ganan_a_pagar_mes(), fila);
                                this.crearCelda(8,(double) r.getDev_IIGG(), fila);
                        }
                }
        try {
                FileOutputStream elFichero;
                elFichero = new FileOutputStream(System.getProperty("user.home") + File.separator + "ImpuestoALasGananciasMontos.xlsx");
                libro.write(elFichero);
            elFichero.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        }
        private void crearFilaTitulo() {
                CellStyle style = this.crearStyleTitulo();
                Row fila = hoja.createRow(0);
                for (int i = 0; i < 9; i++) {
                        hoja.setColumnWidth(i, 5000);
                }
                crearCeldaTexto(0,"Cuil", style, fila);
                crearCeldaTexto(1,"Nombre y apellido", style, fila);
                crearCeldaTexto(2,"Rem Neta Imponible final", style, fila);
                crearCeldaTexto(3,"Ganancia Neta(A)", style, fila);
                crearCeldaTexto(4,"Ganancia Neta(B)", style, fila);
                crearCeldaTexto(5,"Ganancia Neta(C)", style, fila);
                crearCeldaTexto(6,"Impuesto total del periodo", style, fila);
                crearCeldaTexto(7,"Impuesto a pagar en el mes", style, fila);
                crearCeldaTexto(8,"Monto de devolucion", style, fila);
        }

        private void crearCelda(int posicion, Double valor, Row fila) {
                Cell celda = fila.createCell(posicion);
                celda.setCellValue(valor);      
        }
        
        private void crearCelda(int posicion, String elTexto, Row fila) {
                Cell celda = fila.createCell(posicion);
                celda.setCellValue(elTexto);
                
        }
        private void crearCeldaTexto(int posicion, String elTexto, CellStyle style, Row fila) {
                Cell celda = fila.createCell(posicion);
                celda.setCellValue(elTexto);
                celda.setCellStyle(style);
        }

        private CellStyle crearStyleTitulo() {
            CellStyle style = libro.createCellStyle();
            style.setBorderTop((short) 6); // double lines border
            style.setBorderBottom((short) 1); // single line border
            style.setFillBackgroundColor(HSSFColor.GREY_25_PERCENT.index);
        
            Font font = libro.createFont();
            font.setFontName(HSSFFont.FONT_ARIAL);
            font.setFontHeightInPoints((short) 10);
            font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
            font.setColor(HSSFColor.BLUE.index);
            style.setFont(font);
                return style;
        }*/
}
