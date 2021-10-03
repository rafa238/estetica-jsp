<%@page import="java.text.DecimalFormat"%>
<%@page import="modelo.CSucursal"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.CServicio"%>
<%@include file="header.jsp"%>

    <%
        float total = 0;
        float anticipo = 0;
        DecimalFormat fmt = new DecimalFormat("0.00");
    %>
    <div class="container">
        <br/><br/>
        <h1 class="mt-4 mb-3">Carrito de compras</h1>

        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="index.jsp">Inicio</a>
            </li>
            <li class="breadcrumb-item active">Cesta</li>
        </ol>      

        <div class="row">
            <div class="col-md-4 order-md-2 mb-4">
                <h4 class="d-flex justify-content-between align-items-center mb-3">
                    <span class="text-muted">Carrito</span>
                    <%
                    ArrayList<CServicio> lista = new ArrayList();
                    lista = (ArrayList)sesion.getAttribute("cesta");
                    if(lista == null){
                        lista = new ArrayList();
                    }
                    %>
                    <span class="badge badge-secondary badge-pill"><%=lista.size()%></span>
                </h4>
                
                <ul class="list-group mb-3">
                    <%
                    for(int i=0; i<lista.size(); i++){
                        total += lista.get(i).getPrecio();
                    %>
                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                        <div>
                            <h6 class="my-0"><%=lista.get(i).getDetalle()%></h6>
                            <small class="text-muted">Duracion <%=lista.get(i).getDuracion()%> minutos</small>
                        </div>
                        <span class="text-muted">$<%=lista.get(i).getPrecio()%></span>
                        <form class="my-3" action="Cesta?accion=2" method="post">
                            <input type="hidden" value="<%=lista.get(i).getId()%>" name="id">total
                            <button class="btn bg-transparent" type="submit"><span class="fa fa-ban"></span></button>
                        </form>
                    </li>
                    <% }
                       if(total > 0) anticipo = total/2;
                    %>
                    <li class="list-group-item d-flex justify-content-between">
                        <span>Total (MX)</span>
                        <strong>$<%=fmt.format(total)%></strong>
                    </li>
                </ul>
            </div>
            
            <div class="col-md-8 order-md-1">
                <h4 class="mb-3">Datos de la Cita</h4>
            
                <form class="needs-validation" action="Cesta?accion=4" method="post">
                <div class="row">
                    <div class="col-md-5 mb-3">
                        <label for="cp_sucursal">Sucursal:</label>
                        <select id="cp_sucursal" name="cp_sucursal" class="custom-select d-block w-100" required>
                        <%
                        ArrayList<CSucursal> sucursales = (ArrayList) request.getAttribute("sucursales");
                        out.print("<option value=\"0\">Escoje...</option>");
                        for(CSucursal item: sucursales){
                            out.print("<option value=\"" + item.getId() + "\">" + item.getNombre() + "</option>");                        
                        }
                        %>    
                        </select>
                        <div class="invalid-feedback">
                            Requerimos una sucursal.
                        </div>
                    </div>

                    <div class="col-md-4 mb-3">
                        <label for="cp_estilista">Estilista:</label>
                            <select id="cp_estilista" name="cp_estilista" class="custom-select d-block w-100" required>
                            <option value="0">Escoje...</option>
                            </select>
                        <div class="invalid-feedback">
                            Requerimos un estilista.
                        </div>
                    </div>
                    
                    <div class="col-md-3 mb-3">
                        <label for="cp_fecha">Fecha:</label>
                        <input type="text" id="cp_fecha" name="cp_fecha" class="form-control" required readonly>
                        <div class="invalid-feedback">
                            Requerimos la fecha.
                        </div>
                    </div>               
                </div>
                
                <hr class="mb-4">        
                
                <div class="row">
                    <h4 class="mb-3">Seleccione el Metódo de Pago</h4>         
                </div>
             
                <div class="row">
                    <div class="col-md-3 mb-3">
                        <label for="cp_anticipo">Anticipo $:</label>
                        <input type="hidden" id="cp_total" name="cp_total" value="<%=total%>">
                        <input type="text" id="cp_anticipo" name="cp_anticipo" class="form-control" style="font-weight: bold;" value="<%=fmt.format(anticipo)%>" readonly>
                        <div class="invalid-feedback">
                            Se requiere anticipo
                        </div>
                    </div>            
                </div>            

                <div class="d-block my-3">
                    <div class="custom-control custom-radio">
                        <input type="radio" id="credito" name="cp_metodpago" class="custom-control-input" checked required>
                        <label class="custom-control-label" for="credito"><span class="fa fa-credit-card"></span> Tarjeta de Crédito</label> 
                    </div>
                    
                    <div class="custom-control custom-radio">
                        <input type="radio" id="debito" name="cp_metodpago" class="custom-control-input" required>
                        <label class="custom-control-label" for="debito"><span class="fa fa-credit-card-alt"></span> Tarjeta de Débito</label>
                    </div>
                    
                    <div class="custom-control custom-radio">
                        <input type="radio" id="paypal" name="cp_metodpago" class="custom-control-input" required>
                        <label class="custom-control-label" for="paypal"><span class="fa fa-paypal"></span> Paypal</label>
                    </div>
                </div>
            
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="cp_nombre">Nombre del propietario</label>
                        <input type="text" id="cp_nombre" name="cp_nombre" class="form-control"  placeholder="" required>
                        <div class="invalid-feedback">
                            Se requiere Nombredel propietario
                        </div>
                    </div>
                    
                    <div class="col-md-6 mb-3">
                        <label for="cp_numero">Número de tarjeta</label>
                        <input type="text" id="cp_numero" name="cp_numero" class="form-control"  placeholder="" required>
                        <div class="invalid-feedback">
                            Se requiere número de tarjeta 
                        </div>
                    </div>
                </div>
            
                <div class="row">
                    <div class="col-md-3 mb-3">
                        <label for="cp_expira">Expiración</label>
                        <input type="text" id="cp_expira" name="cp_expira" class="form-control"  placeholder="" required>
                        <div class="invalid-feedback">
                            Se requiere la expiración tarjeta
                        </div>
                    </div>
                    
                    <div class="col-md-3 mb-3">
                        <label for="cp_cvv">CVV</label>
                        <input type="text" id="cp_cvv" name="cp_cvv" class="form-control" placeholder="" required>
                        <div class="invalid-feedback">
                            Se requiere el código de seguridad
                        </div>
                    </div>
                </div>

                <hr class="mb-4">
            
                <%
                if(sesion.getAttribute("usuario") == null){
                    out.print("<button class=\"btn btn-primary btn-lg btn-block\" type=\"button\" onclick=\"redireccionar()\">Iniciar Sesión</button>");
                }else{
                    out.print("<button class=\"btn btn-primary btn-lg btn-block\" type=\"submit\">Efectuar cita !!!</button>");
                }
                %>
                </form>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function redireccionar(){
            location.href="sesion.jsp";
        }
    </script>
    
    <br><br>
    <%@include file="footer.jsp"%>
