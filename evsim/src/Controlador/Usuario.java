/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

/**
 *
 * @author alez
 */
public class Usuario {
    public int UsuarioEstrato;
    public int SumaUsuarios;
    public int PorcentajeEst;


    public int getPorcentajeEst() {
        return PorcentajeEst;
    }

    public void setPorcentajeEst(int PorcentajeEst) {
        this.PorcentajeEst = PorcentajeEst;
    }



    public int getSumaUsuarios() {
        return SumaUsuarios;
    }

    public void setSumaUsuarios(int SumaUsuarios) {
        this.SumaUsuarios = SumaUsuarios;
    }

    public int getUsuarioEstrato() {
        return UsuarioEstrato;
    }

    public void setUsuarioEstrato(int UsuarioEstrato) {
        this.UsuarioEstrato = UsuarioEstrato;
    }

    public Usuario(int UsuarioEstrato ,int sumaEstratos) {
        this.SumaUsuarios= sumaEstratos;
        this.UsuarioEstrato = UsuarioEstrato;
        this.PorcentajeEst = CalcularPorcentaje(UsuarioEstrato);
        
        
   }



    public int CalcularPorcentaje(int Usuario)
    {   
        int porcentaje = 0;
        porcentaje = ( 100 * Usuario)/this.SumaUsuarios;
        return porcentaje;
    }


     
}
