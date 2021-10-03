package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.CConsultas;
import modelo.CUsuario;

@WebServlet(name = "Loggin", urlPatterns = {"/Loggin"})
public class Loggin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        
        if(accion != null){        
            try (PrintWriter out = response.getWriter()) {
                CConsultas cons = new CConsultas();

                switch(accion){
                    case "1":
                        HttpSession sesion = request.getSession();
                        String email = request.getParameter("email");
                        String password = request.getParameter("password");

                        if(cons.access(email, password)){
                            CUsuario user = new CUsuario();
                            user = cons.getUsuario(email, password);
                            sesion.setAttribute("usuario", user);

                            if(user.getRol() == 1){
                                response.sendRedirect("admin/admin.jsp");
                            }else{
                                response.sendRedirect("index.jsp");
                            }
                        }else{
                            out.print("<script>");
                            out.print("alert(\"Correo y/o contraseña invalida !!!\");");    
                            out.print("location.href=\"sesion.jsp\";");
                            out.print("</script>");
                        }
                        break;
                    case "2":
                        String mail = request.getParameter("correo");
                        String clave = request.getParameter("clave");
                        String nombre = request.getParameter("nombre");
                        String paterno = request.getParameter("paterno");
                        String materno = request.getParameter("materno");
                        String telefono = request.getParameter("telefono");
                        String direccion = request.getParameter("direccion");
                        System.out.println(mail + clave + nombre + paterno + materno + telefono + direccion);

                        CUsuario user = new CUsuario();
                        user.setNombre(nombre);
                        user.setPaterno(paterno);
                        user.setMaterno(materno);
                        user.setTelefono(telefono);
                        user.setDireccion(direccion);
                        user.setEmail(mail);
                        user.setClave(clave);

                        if(cons.registrar(user)){
                            out.print("<script>");
                            out.print("alert(\"Te has registrado correctamente :)\");");    
                            out.print("location.href=\"sesion.jsp\";");
                            out.print("</script>");
                        }else{
                            out.print("<script>");
                            out.print("alert(\"No te has podido registrar correctamente :(\");");    
                            out.print("location.href=\"sesion.jsp\";");
                            out.print("</script>");
                        }
                        break;
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        processRequest(request, response);
        
        try (PrintWriter out = response.getWriter()) {
            HttpSession sesion = request.getSession();
            sesion.removeAttribute("usuario");
            
            out.print("<script>");
            out.print("alert(\"Sesion finalizada !!!\");");    
            out.print("location.href=\"index.jsp\";");
            out.print("</script>");
        }   
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
