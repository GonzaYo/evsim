package Graficas;

import java.awt.BorderLayout;
import java.awt.image.BufferedImage;
import java.util.Set;
import javax.swing.JPanel;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartFrame;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.xy.XYSeries;
import org.jfree.data.xy.XYSeriesCollection;
import vista.Panel_Principal_1;

public class Grafica
{
    

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String[] getX() {
        return x;
    }

    public void setX(String[] x) {
        this.x = x;
    }

    public int[] getY() {
        return y;
    }

    public void setY(int[] y) {
        this.y = y;
    }
    public int[] getZ() {
        return z;
    }

    public void setZ(int[] z) {
        this.z = z;
    }

    public String x[];
    public int y[];
    public int z[];

    
    private String titulo;
    
    public Grafica(int []y,String [] x,String titulo,int [] z)
    {
        this.y = y;
        this.x = x;
        this.z = z;
        this.titulo = titulo;
      
    }
    public Grafica() {
        System.out.println("No has insertado argumentos");
    }

    public JFreeChart GraficarLinea(){
        System.out.print(this.getTitulo());
        XYSeries series = new XYSeries("XYGraph");
        series.add(1,this.y[0]);
        series.add(2,this.y[1]);
        series.add(3,this.y[2]);
        series.add(4,this.y[3]);
        series.add(5,this.y[4]);

        // Add the series to your data set
        XYSeriesCollection dataset = new XYSeriesCollection();
        dataset.addSeries(series);

        // Generate the graph
        JFreeChart chart1 = ChartFactory.createXYLineChart(
            this.titulo, // Title
            "x-axis", // x-axis Label
            "y-axis", // y-axis Label
            dataset, // Dataset
            PlotOrientation.VERTICAL, // Plot Orientation
            true, // Show Legend
            true, // Use tooltips
            false // Configure chart to generate URLs?
        );
        return chart1;
    
    }
    
    public JFreeChart GraficarTorta()
    {
        DefaultPieDataset data = new DefaultPieDataset();
        for(int d=0;d<this.y.length;d++)
        {
           data.setValue(this.x[d],this.y[d]);  
        }
        JFreeChart chart = ChartFactory.createPieChart(this.titulo,data,true,true,true);
        return chart;
    }
    public BufferedImage GraficarLinea1(){
        System.out.print(this.getTitulo());
        XYSeries series = new XYSeries("XYGraph");
        series.add(1,this.y[1]);
        series.add(2,this.y[2]);
        series.add(3,this.y[3]);
        series.add(4,this.y[4]);
        

        // Add the series to your data set
        XYSeriesCollection dataset = new XYSeriesCollection();
        dataset.addSeries(series);

        // Generate the graph
        JFreeChart chart1 = ChartFactory.createXYLineChart(
            "XY Chart", // Title
            "x-axis", // x-axis Label
            "y-axis", // y-axis Label
            dataset, // Dataset
            PlotOrientation.VERTICAL, // Plot Orientation
            true, // Show Legend
            true, // Use tooltips
            false // Configure chart to generate URLs?
        );
        
        BufferedImage image = chart1.createBufferedImage(400,400);
        
        return image;
    
    }
}


/*
 
 --------------------------------------------------------
--> Mandar a llamar grafica circular.
--------------------------------------------------------

  if(TodosCampos1.isSelected()==false)
  {
   JOptionPane.showMessageDialog(getContentPane(), "Necesario Consulta Todos los Campos" );
  }
  else
  {
               try
               {
               int a1[]=new int[TablaUsuarioConsulta1.getRowCount()];
               String a2[]=new String[TablaUsuarioConsulta1.getRowCount()];
               long a3[]=new long[TablaUsuarioConsulta1.getRowCount()];
               String a4[]=new String[TablaUsuarioConsulta1.getRowCount()];
   
        for (int y=0;y<a1.length;y++)
        {
        a2[y]=((Long)TablaUsuarioConsulta1.getValueAt(y,1)).toString();
        a1[y]=Integer.parseInt(a2[y]);
        a4[y]=((String)TablaUsuarioConsulta1.getValueAt(y,0));
        }

     new Grafica().graficar(a1,a4,"Codigo Postal");
               }
               catch(Exception e)
               {
                            JOptionPane.showMessageDialog(getContentPane(),e);
               }
  }
-----------------------------------------------------
* 
* ----------------------------------------------------
* 

   XYSeriesCollection dataset = new XYSeriesCollection();
    dataset.addSeries(series);
    JFreeChart chart = ChartFactory.createXYLineChart(null, null, null, dataset, PlotOrientation.HORIZONTAL, true, true, true);
    ChartPanel chartpanel = new ChartPanel(chart);

    chartpanel.setDomainZoomable(true);
    jPanel4.setLayout(new BorderLayout());
    jPanel4.add(chartpanel, BorderLayout.NORTH);


 */

