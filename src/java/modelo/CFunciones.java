package modelo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CFunciones {

    public CFunciones() {
        
    }
    
    public Date parseFecha(String param) {
        SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
        Date fecha = null;
        try {
            fecha = formato.parse(param);
        } 
        catch (Exception ex) 
        {
            System.out.println(ex);
        }
        
        return fecha;
    }
    
    public String parseFechaMySQL(String fecha){
        if(fecha.length()>0)
            fecha = ((fecha.substring(6)).concat(fecha.substring(2,6)).concat(fecha.substring(0,2))).replace('/','-');
        else fecha = "";
        
        return fecha;
    }
}
