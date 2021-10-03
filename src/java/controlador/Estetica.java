package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.CConsultas;
import modelo.CServicio;
import modelo.CSucursal;


@WebServlet(name = "Estetica", urlPatterns = {"/Estetica"})
public class Estetica extends HttpServlet {
    PrintWriter out = null;
    CConsultas datos = null;
            
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        out = response.getWriter();
        String accion = request.getParameter("a");
        ArrayList<CSucursal> sucursales = null;
        
        if (accion == null) accion = "";
        
        switch (accion){
            case "1"://Servicios
                ArrayList<CServicio> servicios = new ArrayList();
                datos = new CConsultas();
                servicios = datos.getServicios();
                
                request.setAttribute("servicios", servicios);
                request.getRequestDispatcher("servicios.jsp").forward(request,response);                
                break;
            case "2"://Carrito
                sucursales = new ArrayList();
                datos = new CConsultas();
            
                try {
                    sucursales = datos.getSucursales();
                } catch (SQLException ex) {
                    System.out.println("---> SQL_Error (Estetica:Carrito): " + ex);
                }
                
                request.setAttribute("sucursales", sucursales);
                request.getRequestDispatcher("carrito.jsp").forward(request,response);                  
                break;
            case "3"://Contacto
                sucursales = new ArrayList();
                datos = new CConsultas();
            
                try {
                    sucursales = datos.getSucursales();
                } catch (SQLException ex) {
                    System.out.println("---> SQL_Error (Estetica:Contacto): " + ex);
                }
                
                request.setAttribute("sucursales", sucursales);
                request.getRequestDispatcher("contacto.jsp").forward(request,response);                  
                break;
            case "4"://Iniciar Sesión
                request.getRequestDispatcher("sesion.jsp").forward(request,response);
                break;
            case "5"://Registrar Usuario
                request.getRequestDispatcher("registro.jsp").forward(request,response);
                break;
            case "6"://
               
                break;                
            default:
                request.getRequestDispatcher("index.jsp").forward(request,response);
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    public String getServletInfo() {
        return "Short description";
    }

}
