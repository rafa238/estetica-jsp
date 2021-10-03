<%@include file="header.jsp"%>
<div class="container">
    <div class="row">
        <div class="col-lg-8 mb-4" style="margin-top: 6%">
            <h3 class="h3">Crear Cuenta</h3>
            <form class="needs-validation" action="Loggin?accion=2" method="post">
                <div class="control-group form-group">
                  <div class="controls">
                    <label>Nombre:</label>
                    <input type="text" name="nombre" class="form-control" id="name" required onkeyup="revisar(this)" onblur="revisar(this)">
                    <p class="help-block alert-danger" id="nombremal"></p>
                  </div>
                </div>
                
                <div class="control-group form-group">
                  <div class="controls">
                    <label>Apellido Paterno:</label>
                    <input type="text" name="paterno" class="form-control" id="paterno" required onkeyup="revisar(this)" onblur="revisar(this)">
                    <p class="help-block alert-danger"></p>
                  </div>
                </div>
                
                <div class="control-group form-group">
                  <div class="controls">
                    <label>Apellido Materno:</label>
                    <input type="text" name="materno" class="form-control" id="materno" required onkeyup="revisar(this)" onblur="revisar(this)">
                    <p class="help-block alert-danger"></p>
                  </div>
                </div>
                
                <div class="control-group form-group">
                  <div class="controls">
                    <label>Tel&eacute;fono:</label>
                    <input type="text" name="telefono" class="form-control" id="phone"  required onblur="revisar(this); revisaNumero(this)" onkeypress="return validaNumericos(event)" onkeyup="revisar(this); revisaNumero(this)">
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
                        <label>Contraseña:</label>
                        <input type="password" name="clave" class="form-control" id="password"  required onkeyup="revisar(this)" onblur="revisar(this)">
                        <p class="help-block alert-danger"></p>
                    </div>
                </div>
                
                <div class="control-group form-group">
                    <div class="controls">
                        <label>Direcci&oacute;n:</label>
                        <textarea name="direccion" rows="10" cols="100" class="form-control" id="message" maxlength="999" style="resize:none" onkeyup="revisar(this)" onblur="revisar(this)" required></textarea>
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
