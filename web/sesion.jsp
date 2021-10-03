<%-- 
    Document   : sesion
    Created on : 7/07/2020, 07:00:33 PM
    Author     : Rafa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="img/favicon.ico">
        <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/sign-in/">
        <script src="js/validaciones.js" type="text/javascript"></script>
        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <title>Xtreme - NewImage</title>
        <!-- Custom styles for this template -->
        <link href="css/signin.css" rel="stylesheet" type="text/css"/>
        <style>
            body{
               color: #fff;
               background-color: #444;
            }
            
            .img-circle {
                border-radius: 50%;
                width: 200px;
                height: 200px;
            }            
        </style>
    </head>
    
    <body class="text-center">
        <form class="form-signin" action="Loggin?accion=1" method="post">
          <img class="mb-4 img-circle" src="img/logo.jpg" alt="">
          <h1 class="h3 mb-3 font-weight-normal">Xtreme - NewImage</h1>
          <label for="inputEmail" class="sr-only">Correo</label>
          <input type="email" id="inputEmail" class="form-control" placeholder="Correo Electronico" required="" autofocus="" name="email" onblur="revisar(this); revisarEmail(this)" onkeyup="revisar(this); revisarEmail(this)">
          <label for="inputPassword" class="sr-only">Contraseña</label>
          <input type="password" id="inputPassword" class="form-control" placeholder="Contraseña" required="" name="password" onkeyup="revisar(this)" onblur="revisar(this)">
          <!--<div class="checkbox mb-3">
            <label>
              <input type="checkbox" value="remember-me"> Remember me
            </label>
          </div>-->
          <input class="btn btn-lg btn-success btn-block" type="submit" value="Ingresar">
          <p class="mt-5 mb-3 text-muted">Copyright &copy; 2020 | <a href="index.jsp">®Xtreme - NewImage</a></p>
        </form>
    </body>
</html>