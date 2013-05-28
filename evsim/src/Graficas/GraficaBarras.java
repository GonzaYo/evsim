package Graficas;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartFrame;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;



public class GraficaBarras {
    public void graficarbarras(int []y,String []x,String datah,String datav,String titulo)
    {
       DefaultCategoryDataset data = new DefaultCategoryDataset();
        for(int d=0;d<y.length;d++)
        {
         data.setValue(y[d],x[d],x[d]);  
        }
        JFreeChart chart = ChartFactory.createBarChart(titulo,datah,datav,data, PlotOrientation.VERTICAL, false,
true, false);
        ChartFrame frame=new ChartFrame(titulo,chart);
        frame.pack();
        frame.setVisible(true);
    }   
}


/*
 --------------------------------------------------------
--> Mandar a llamar grafica de barras.
--------------------------------------------------------
   if(TodosCampos.isSelected()==false)
   {
    JOptionPane.showMessageDialog(getContentPane(), "Necesario Consulta Todos los Campos" );
   }
   else
    {
     try
 {
     int a1[]=new int[TablaLibrosConsulta.getRowCount()];
     String a2[]=new String[TablaLibrosConsulta.getRowCount()];
     for (int y=0;y<a1.length;y++)//llenar arreglos
     {
         a1[y]=Integer.parseInt((String)TablaLibrosConsulta.getValueAt(y,7));
         a2[y]=((String)TablaLibrosConsulta.getValueAt(y,1));
     }
 new GraficaBarras().graficarbarras(a1,a2,"Libros","Paginas","Paginas Libro");
 }
                catch(Exception e)
 {
                            JOptionPane.showMessageDialog(getContentPane(),e);
                }
     } 
 */