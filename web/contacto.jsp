<%@page import="modelo.CSucursal"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.CConsultas"%>
<%@include file="header.jsp"%>

    <!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <br/><br/>
      <h1 class="mt-4 mb-3">Acercate a una de nuestras sucursales !!!</h1>

      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="index.jsp">Inicio</a>
        </li>
        <li class="breadcrumb-item active">Contacto</li>
      </ol>
        <%
        ArrayList<CSucursal> sucursales = (ArrayList) request.getAttribute("sucursales");
        out.print("<option value=\"0\">Escoje...</option>");
        for(CSucursal item: sucursales){
        %>
        <div class="row featurette">
            <div class="col-md-6 order-md-2">
                <h2 class="featurette-heading"><%=item.getNombre()%></span></h2>
                <p class="lead"><span class="fa fa-address-card" aria-hidden="true"></span>&nbsp;&nbsp;<%=item.getDireccion()%></p>
                <p><span class="fa fa-phone" aria-hidden="true"></span>&nbsp;&nbsp;(55)5434-0487</p>
                <p>
                    <span class="fa fa-clock-o" aria-hidden="true"></span>&nbsp;&nbsp;Lunes - Viernes: 9:00 AM a 4:00 PM
                </p>
            </div>
            <div class="col-lg-6">
                <img class="img-fluid rounded" src="img/estetica<%=item.getId()%>.jpg" alt="Generic placeholder image">
            </div>
        </div>
        <hr class="featurette-divider">
        <% } %>
      <div class="row">
        <div class="col-lg-8 mb-4">
          <h3>Contacto</h3>
            <form class="needs-validation" id="contactForm" action="Email">
                    <div class="control-group form-group">
                      <div class="controls">
                        <label>Nombre:</label>
                        <input type="text" name="nombre" class="form-control" id="name" required onkeyup="revisar(this)" onblur="revisar(this)">
                        <p class="help-block alert-danger"></p>
                      </div>
                    </div>
                    <div class="control-group form-group">
                      <div class="controls">
                        <label>Tel&eacute;fono:</label>
                        <input type="text" name="telefono" class="form-control" id="phone"  required required onblur="revisar(this); revisaNumero(this)" onkeypress="return validaNumericos(event)" onkeyup="revisar(this); revisaNumero(this)">
                        <p class="help-block alert-danger"></p>
                      </div>
                    </div>
                    <div class="control-group form-group">
                      <div class="controls">
                        <label>Email:</label>
                        <input type="email" name="correo" class="form-control" id="email"  onblur="revisar(this); revisarEmail(this)" onkeyup="revisar(this); revisarEmail(this)" required>
                        <p class="help-block alert-danger"></p>
                      </div>
                    </div>
                    <div class="control-group form-group">
                      <div class="controls">
                        <label>Asunto:</label>
                        <textarea name="mensaje" rows="10" cols="100" class="form-control" id="message" maxlength="999" style="resize:none" onkeyup="revisar(this)" onblur="revisar(this)" required></textarea>
                        <p class="help-block alert-danger"></p>
                      </div>
                    </div>
                    <div id="success"></div>
                    <!-- For success/fail messages -->
                    <button type="reset" class="btn btn-primary" id="sendMessageButton">Limpiar</button>
                    <input type="submit" class="btn btn-primary" id="sendMessageButton" value="Enviar">
            </form>
        </div>

      </div>
    </div>

<%@include file="footer.jsp"%>
