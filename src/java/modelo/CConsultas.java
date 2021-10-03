package modelo;

import java.sql.*;
import java.util.ArrayList;


public class CConsultas {
    Connection cn = null;
    Statement st = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String strSQL = "";
    
    public CConsultas(){
        CConexion con = new CConexion();
        this.cn = con.getConnection();
    }
    
    public boolean registraCita(String cp_sucursal, String cp_estilista, String cp_fecha, String cp_total, String cp_anticipo, String cp_metodpago, ArrayList<CServicio> cesta, CUsuario user) throws SQLException{
        boolean bFlag = false;
        String pk_folio ="";
        String cp_usuario = Integer.toString(user.getId());
        
        try{
            cn.setAutoCommit(false);
            st = cn.createStatement();

            strSQL = "INSERT INTO m_reservacion(pk_i_reserva, pk_i_usuario, f_d_fecha, f_d_horaini, f_d_horafin, d_c_total, d_n_pagado, f_d_fechcap, w_v_status) " +
                     "VALUES(null, " + cp_usuario + ", '" + cp_fecha + "', null, null, " + cp_total + ", 0, NOW(), 'A');";
            
            if (st.executeUpdate(strSQL, Statement.RETURN_GENERATED_KEYS) > 0){
                rs = st.getGeneratedKeys();
                if (rs.next()){
                    pk_folio = rs.getString(1);
                    
                    strSQL = "INSERT INTO o_pagos(pk_i_pago, pk_i_reserva, d_c_pago, c_i_metodpago, f_d_fechcap, w_v_status) " +
                             "VALUES(null, " + pk_folio + ", " + cp_anticipo + ", " + cp_metodpago + ", NOW(), 'A');";                                  
                    st.executeUpdate(strSQL);                    
                    
                    if(cesta != null){
                        for(int i=0; i<cesta.size(); i++){
                            strSQL = "INSERT INTO d_reservacion(pk_i_reserva, pk_i_servicio, pk_i_estilista, f_d_fechcap, w_v_status) " +
                                     "VALUES(" + pk_folio + ", " + cesta.get(i).getId() + ", " + cp_estilista + ", NOW(), 'A');";
                            st.executeUpdate(strSQL);
                        }
                    }
                    
                    cn.commit();
                    cn.setAutoCommit(true);
                    bFlag = true;
                }
            }
        }catch(SQLException ex){
            cn.rollback();
            cn.setAutoCommit(true);
            System.out.println("La transacción al registrar, no se logro completar: " + ex.getMessage());
            ex.printStackTrace();
        }finally{
            if (rs != null) rs.close();
            if (st != null) st.close();
            cn.close();                
        }     
        
        return bFlag;
    }
    
    public ArrayList getServicios(){
        ArrayList<CServicio> lista = new ArrayList<>();
        
        try {
            strSQL = "SELECT * FROM c_servicios;";
            ps = cn.prepareStatement(strSQL);
            rs = ps.executeQuery();
            
            while(rs.next()){
                CServicio srv = new CServicio();
                srv.setId(rs.getInt("pk_i_servicio"));
                srv.setDetalle(rs.getString("d_v_detalle"));
                srv.setDuracion(rs.getInt("d_i_duracion"));
                srv.setPrecio(rs.getFloat("d_c_precio"));
                lista.add(srv);
            }
        } catch (SQLException ex) {
            System.out.println("----------> SQL_Error " + ex);
        }     
        
        return lista;
    }
    
    public boolean access(String email, String password){
        boolean access = false;
        
        try {
            strSQL = "SELECT * FROM c_usuarios WHERE d_v_correo=? AND d_v_clave=?;";
            ps = cn.prepareStatement(strSQL);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if(rs.next()){
                access = true;
            }
        } catch (SQLException ex) {
            System.out.println("----------> SQL_Error " + ex);
        }     
        
        return access;
    }
    
    public CServicio getServicio(int id){
        CServicio serv = new CServicio();
        
        try {
            strSQL = "SELECT * FROM c_servicios WHERE pk_i_servicio=?";
            ps = cn.prepareStatement(strSQL);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            
            while(rs.next()){
                serv.setId(id);
                serv.setDetalle(rs.getString("d_v_detalle"));
                serv.setDuracion(rs.getInt("d_i_duracion"));
                serv.setPrecio(rs.getFloat("d_c_precio"));
            }
        } catch (SQLException ex) {
            System.out.println("---------->SQL_Error " + ex);
        }     
        
        return serv;
    }
    
    public CUsuario getUsuario(String email, String password){
        CUsuario u = new CUsuario();
        
        try {
            strSQL = "SELECT * FROM c_usuarios WHERE d_v_correo=? AND d_v_clave=?";
            ps = cn.prepareStatement(strSQL);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();
            
            while(rs.next()){
                u.setId(rs.getInt("pk_i_usuario"));
                u.setRol(rs.getInt("pk_i_rolusu"));
                u.setEmail(rs.getString("d_v_correo"));
                u.setClave(rs.getString("d_v_clave"));
                u.setNombre(rs.getString("d_v_nombre"));
                u.setPaterno(rs.getString("d_v_paterno"));
                u.setMaterno(rs.getString("d_v_materno"));
                u.setTelefono(rs.getString("d_v_telefono"));
                u.setDireccion(rs.getString("d_v_direccion"));
                u.setStatus(rs.getString("w_v_status"));
            }
        } catch (SQLException ex) {
            System.out.println("----------> SQL_Error " + ex);
        }     
        
        return u;
    }
    
    public ArrayList getSucursales() throws SQLException{
        ArrayList<CSucursal> lista = new ArrayList<>();
        try {
            strSQL = "SELECT pk_i_sucursal, d_v_nombre, d_v_direccion " +
                     "FROM c_sucursales " +
                     "WHERE w_v_status = 'A' ORDER BY 2;";
            st = cn.createStatement();
            rs = st.executeQuery(strSQL);
            
            while(rs.next()){
                CSucursal suc = new CSucursal();
                suc.setId(rs.getInt("pk_i_sucursal"));
                suc.setNombre(rs.getString("d_v_nombre"));
                suc.setDireccion(rs.getString("d_v_direccion"));
                lista.add(suc);
            }
        } catch (SQLException ex) {
            System.out.println("---> SQL_Error (getSucursales): " + ex);
        }finally{
            if(rs != null) rs.close();
            if(st != null) st.close();
            cn.close();
        }   
        
        return lista;
    }
    
    public String getEstilistas(String sucursal) throws SQLException{
        String datos = "<option value=\"0\">Escoje...</option>";
        
        try{
            strSQL = "SELECT c_estilistas.pk_i_estilista, " +
                     "CONCAT_WS(' ', c_estilistas.d_v_nombre, c_estilistas.d_v_paterno, c_estilistas.d_v_materno) AS d_v_nombre " +
                     "FROM c_estilistas " +
                     "INNER JOIN c_sucursales ON c_estilistas.pk_i_sucursal = c_sucursales.pk_i_sucursal " +
                     "WHERE c_sucursales.pk_i_sucursal = ? AND c_estilistas.w_v_status = 'A';";
            ps = cn.prepareStatement(strSQL);
            ps.setString(1, sucursal);
            rs = ps.executeQuery();
            
            while(rs.next()){
                datos += "<option value=\"" + rs.getInt("pk_i_estilista") + "\">" + rs.getString("d_v_nombre") + "</option>";
            }
        } catch (SQLException ex) {
            System.out.println("---> SQL_Error (getEstilistas): " + ex);
        }finally{
            if(rs != null) rs.close();
            if(ps != null) ps.close();
            cn.close();
        }
        
        return datos;
    }
    
    public boolean registrar(CUsuario u){
        boolean registrado = false;
        try{
            String sql = "INSERT INTO c_usuarios VALUES(default,?,?,?,?,?,?,?,?,?)";
            ps = cn.prepareStatement(sql);
            ps.setInt(1 , 2);
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getClave());
            ps.setString(4, u.getNombre());
            ps.setString(5, u.getPaterno());
            ps.setString(6, u.getMaterno());
            ps.setString(7, u.getTelefono());
            ps.setString(8, u.getDireccion());
            ps.setString(9, "A");
            ps.executeUpdate();
            registrado = true;
        }catch (SQLException ex) {
            System.out.println("---------->SQL_Error " + ex);
        }
        return registrado;
    }         
    
}
