package Controlador;



/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author alez
 */
public class Usuarios {

    public int getUsuarioEstrato_1() {
        return UsuarioEstrato_1;
    }

    public void setUsuarioEstrato_1(int UsuarioEstrato_1) {
        this.UsuarioEstrato_1 = UsuarioEstrato_1;
    }

    public int getUsuarioEstrato_2() {
        return UsuarioEstrato_2;
    }

    public void setUsuarioEstrato_2(int UsuarioEstrato_2) {
        this.UsuarioEstrato_2 = UsuarioEstrato_2;
    }

    public int getUsuarioEstrato_3() {
        return UsuarioEstrato_3;
    }

    public void setUsuarioEstrato_3(int UsuarioEstrato_3) {
        this.UsuarioEstrato_3 = UsuarioEstrato_3;
    }

    public int getUsuarioEstrato_4() {
        return UsuarioEstrato_4;
    }

    public void setUsuarioEstrato_4(int UsuarioEstrato_4) {
        this.UsuarioEstrato_4 = UsuarioEstrato_4;
    }

    public int getUsuarioEstrato_5() {
        return UsuarioEstrato_5;
    }

    public void setUsuarioEstrato_5(int UsuarioEstrato_5) {
        this.UsuarioEstrato_5 = UsuarioEstrato_5;
    }
    public int getSumaUsuarios() {
        return SumaUsuarios;
    }

    public void setSumaUsuarios(int SumaUsuarios) {
        this.SumaUsuarios = SumaUsuarios;
    }
    public int UsuarioEstrato_1;
    public int UsuarioEstrato_2;
    public int UsuarioEstrato_3;
    public int UsuarioEstrato_4;
    public int UsuarioEstrato_5;
    public int SumaUsuarios;
    public int VectorGrafica[];
    public String VectorGraficax[];
    public String Est1,Est2,Est3,Est4,Est5; 


    public void Usuarios (int UsuarioEstrato_1,int UsuarioEstrato_2,int UsuarioEstrato_3,int UsuarioEstrato_4,int UsuarioEstrato_5) {
        this.UsuarioEstrato_1=UsuarioEstrato_1;
        this.UsuarioEstrato_2=UsuarioEstrato_2;
        this.UsuarioEstrato_3=UsuarioEstrato_3;
        this.UsuarioEstrato_4=UsuarioEstrato_4;
        this.UsuarioEstrato_5=UsuarioEstrato_5;
        this.SumaUsuarios = UsuarioEstrato_1+UsuarioEstrato_2+UsuarioEstrato_3+UsuarioEstrato_4+UsuarioEstrato_5;
        this.Est1 = Integer.toString(this.CalcularPorcentaje(UsuarioEstrato_1));
        this.Est2 = Integer.toString(this.CalcularPorcentaje(UsuarioEstrato_2));
        this.Est3 = Integer.toString(this.CalcularPorcentaje(UsuarioEstrato_3));
        this.Est4 = Integer.toString(this.CalcularPorcentaje(UsuarioEstrato_4));
        this.Est5 = Integer.toString(this.CalcularPorcentaje(UsuarioEstrato_5));
        String VectorGraficax[] = {Est1+"% Est1",Est2+"% Est2",Est3+"% Est3",Est4+"% Est4",Est5+"% Est5"};
        int VectorGrafica[] = {UsuarioEstrato_1,UsuarioEstrato_2,UsuarioEstrato_3,UsuarioEstrato_4,UsuarioEstrato_5};
        

        
    }
    public int CalcularPorcentaje(int Usuario)
    {
        int porcentaje = 0;
        porcentaje = ( 100 * Usuario)/this.SumaUsuarios;
        return porcentaje;
    } 
      
}
