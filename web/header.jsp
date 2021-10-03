<%@page import="modelo.CUsuario"%>
<!DOCTYPE html>
<html lang="es-419">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name = "format-detection" content = "telephone=no" />
        <meta name="auto" content="Xtreme - NewImage" />
        <meta name="title" content="Estetica Xtreme - NewImage" />
        <meta name="author" content="Rafael Juárez Laureano" />
        <meta name="description" content="Estetica Xtreme - NewImage. El lugar ideal para destacar el potencial de tu belleza." />
        <meta name="keywords" content="El lugar ideal para destacar el potencial de tu belleza" />
        <meta name="Generator" content="Estetica Xtreme - NewImage" />
        <meta name="robots" content="index, follow" >	
        <link rel="shortcut icon" href="img/favicon.ico" />
        <title>Xtreme - NewImage</title>
        <script src="js/validaciones.js" type="text/javascript"></script>
        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
        <link href="css/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"> 
        <link href="css/theme/jquery-ui-1.10.4.custom.css" rel="stylesheet" type="text/css"> 
        
        <!-- Custom styles for this template -->
        <link href="css/custom-styles.css" rel="stylesheet" type="text/css">
        <link href="css/form-validation.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
    <%
       HttpSession sesion = request.getSession();
    %>
    <!-- Navigation -->
    <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="Estetica">
                <h1 style="color:#fff;">Xtreme - NewImage</h1>
            </a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="Estetica">Nosotros</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Estetica?a=1">Servicios</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Estetica?a=2">Agendar Cita</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Estetica?a=3">Contacto</a>
                    </li>
                    <%
                        CUsuario u = new CUsuario();
                        u = (CUsuario)sesion.getAttribute("usuario");
                        if( u == null){
                    %>
                    <li class="nav-item">
                        <div class="dropdown">
                            <a style="border: none" class="nav-link dropdown-toggle" href="#" role="text" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              Bienvenido
                            </a>

                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                              <a class="dropdown-item" href="Estetica?a=4">Iniciar Sesion</a>
                              <a class="dropdown-item" href="Estetica?a=5">Registrarme</a>
                            </div>
                        </div>
                    </li>
                    <%
                        }else{
                    %>
                    <li class="nav-item">
                        <div class="dropdown">
                            <a style="border: none" class="nav-link dropdown-toggle" href="#" role="text" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              Hola <%=u.getNombre()%>
                            </a>

                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                              <a class="dropdown-item" href="Loggin">Cerrar Sesion</a>
                            </div>
                        </div>
                    </li>
                    <%
                        }
                    %>
                </ul>
            </div>
        </div>
    </nav>
    <!-- end Navigation -->