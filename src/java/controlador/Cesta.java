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
import javax.servlet.http.HttpSession;
import modelo.CConsultas;
import modelo.CFunciones;
import modelo.CServicio;
import modelo.CUsuario;

@WebServlet(name = "Cesta", urlPatterns = {"/Cesta"})
public class Cesta extends HttpServlet {
    private PrintWriter out = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession sesion = request.getSession();
        out = response.getWriter();
        String accion = request.getParameter("accion");
        ArrayList<CServicio> cesta = (ArrayList)sesion.getAttribute("cesta");
        CUsuario user = (CUsuario)sesion.getAttribute("usuario");
        
        if(cesta == null){
            cesta = new ArrayList();
        }
        
        switch (accion){
            case "1"://Agregar
                int idserv = Integer.parseInt(request.getParameter("idservicio"));
                CServicio serv = new CServicio();
                CConsultas cons = new CConsultas();
                serv = cons.getServicio(idserv);
                cesta.add(serv);
                sesion.setAttribute("cesta", cesta);
                request.getRequestDispatcher("Estetica?a=1").forward(request, response);
                break;            
            case "2"://Elimininar
                int id = Integer.parseInt(request.getParameter("id"));
                for(int i=0; i<cesta.size(); i++){
                    if(cesta.get(i).getId() == id){
                        cesta.remove(i);
                    }
                }
                request.getRequestDispatcher("Estetica?a=2").forward(request, response);
                break;
            case "3"://Obtener estilistas
                String sucursal = request.getParameter("sucursal");
                try{
                    out.print( new CConsultas().getEstilistas(sucursal) );
                } catch (SQLException ex) {
                    System.out.println("---> SQL_Error (Cesta:Sucursal): " + ex);
                }
                break;
            case "4"://Registrar cita
                boolean bRegistrar = false;
                String cp_sucursal = request.getParameter("cp_sucursal");
                String cp_estilista = request.getParameter("cp_estilista");
                String cp_fecha = request.getParameter("cp_fecha");
                String cp_total = request.getParameter("cp_total");
                String cp_anticipo = request.getParameter("cp_anticipo");
                String cp_metodpago = "1"; //request.getParameter("cp_metodpago");
                //String cp_nombre = request.getParameter("cp_nombre");
                //String cp_numero = request.getParameter("cp_numero");
                //String cp_expira = request.getParameter("cp_expira");
                //String cp_cvv = request.getParameter("cp_cvv");
                
                cp_fecha = new CFunciones().parseFechaMySQL(cp_fecha);
                
                try {
                    bRegistrar = new CConsultas().registraCita(cp_sucursal, cp_estilista, cp_fecha, cp_total, cp_anticipo, cp_metodpago, cesta, user);
                } catch (SQLException ex) {
                    System.out.println("La transacción al registrar, no se logro completar: " + ex.getMessage());
                    ex.printStackTrace();
                }

                if(bRegistrar){
                    out.print("<script>");
                    out.print("alert(\"Información registrada correctamente :)\");");    
                    out.print("location.href=\"index.jsp\";");
                    out.print("</script>");                    
                }else{
                    out.print("<script>");
                    out.print("alert(\"Error al registrar :(\");");    
                    out.print("location.href=\"carrito.jsp\";");
                    out.print("</script>");                      
                }              
                
                break;

            default:
                response.sendRedirect("index.jsp");
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
