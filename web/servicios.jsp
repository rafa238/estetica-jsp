<%@page import="modelo.CServicio"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.CConsultas"%>
<%@include file="header.jsp"%>

    <!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <br/><br/>
      <h1 class="mt-4 mb-3">Servicios</h1>

      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="index.jsp">Inicio</a>
        </li>
        <li class="breadcrumb-item active">Servicios</li>
      </ol>

        <div class="row">
            <%
            ArrayList<CServicio> servicios = (ArrayList) request.getAttribute("servicios");
            for(CServicio item: servicios){
            %>  
            <div class="col-lg-3 portfolio-item">
                <div class="card h-100">
                    <div class="card-body">
                        <h4 class="card-title">
                          <a href="#"><%=item.getDetalle()%></a>
                        </h4>
                        <p class="card-text">
                              <p>Desde $<%=item.getPrecio()%></p>
                        </p>
                        <form method="post" action="Cesta?accion=1">
                            <input type="hidden" value="<%=item.getId()%>" name="idservicio">
                            <input type="submit" class="btn btn-primary" value="Agregar">
                        </form>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>
<%@include file="footer.jsp"%>