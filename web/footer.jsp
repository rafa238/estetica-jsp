		
    <!-- Footer -->
    <footer class="py-4 bg-dark">
        <div class="container">
            <p class="m-0 text-center text-white">Copyright &copy; 2020 | <em><a class="text-white" href="#">®Xtreme - NewImage</a></em></p>
        </div>
    </footer>
    
    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/jquery/jquery-ui-1.10.4.custom.min.js"></script>
    <script src="vendor/jquery/ui.datepicker-es.js"></script>
    
    <!-- Custom JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>
    <script type="text/javascript">
        $(function(){
            $("#cp_sucursal").change(function(){
                var selec = $(this).find("option:selected").val();
                
                if(selec != "" && selec != "0"){
                    $.post("/estetica/Cesta", 
                        {accion:"3", sucursal:selec},
                        function(response){
                            if(response.trim().length == '')
                                alert("Sin informaci\u00f3n que mostrar");
                            else{
                                $("#cp_estilista").html(response);
                            }
                    });                    
                }
            });
            
            $("#cp_fecha").datepicker({
                /*changeMonth: true,
                showAnim: "clip",*/
                dateFormat: "dd/mm/yy",
                beforeShowDay: $.datepicker.noWeekends
            }).datepicker("setDate", new Date());
            
            //$(".invalid-feedback").show();
            
        });
    </script>
    </body>
</html>