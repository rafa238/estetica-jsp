<%@include file="header.jsp"%>
    <!-- Carrousel -->
    <header class="carrusel">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <!-- Slide One - Set the background image for this slide in the line below -->
                <div class="carousel-item active" style="background-image: url('img/slider-img-01.jpg')">
                    <div class="carousel-caption d-none d-md-block">
                        <h3>Estilizado&nbsp;&bull;&nbsp;Peinado&nbsp;&bull;&nbsp;Corte</h3>
                    </div>
                </div>
                <!-- Slide Two - Set the background image for this slide in the line below -->
                <div class="carousel-item" style="background-image: url('img/slider-img-02.jpg')">
                    <div class="carousel-caption d-none d-md-block">
                        <h3>Maquillaje&nbsp;&bull;&nbsp;Pestañas&nbsp;&bull;&nbsp;Manicure</h3>
                    </div>
                </div>
                <!-- Slide Three - Set the background image for this slide in the line below -->
                <div class="carousel-item" style="background-image: url('img/slider-img-03.jpg')">
                    <div class="carousel-caption d-none d-md-block">
                        <h3>Peluqueria para caballero</h3>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </header>
    <!-- end Carrousel -->
    
    <!-- Page Content -->
    <div class="container">         
        <!-- Three columns of text below the carousel -->
        <br><br>
        <div class="row text-center">
            <div class="col-lg-4">
                <img class="rounded-circle" src="img/p1.jpg" alt="Generic placeholder image" width="140" height="140">
                <h2>Tintes</h2>
                <!-- <p>Donec sed odio dui. Etiam porta sem malesuada magna mollis euismod. Nullam id dolor id nibh ultricies vehicula ut id elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo cursus magna.</p>
                <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p> -->
            </div>
            <div class="col-lg-4">
                <img class="rounded-circle" src="img/p2.jpg" alt="Generic placeholder image" width="140" height="140">
                <h2>Bodas</h2>
                <!-- <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh.</p>
                <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p> -->
            </div>
            <div class="col-lg-4">
                <img class="rounded-circle" src="img/p3.jpg" alt="Generic placeholder image" width="140" height="140">
                <h2>Peinados</h2>
                <!-- <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
                <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p> -->
            </div>
        </div>

        <hr class="featurette-divider">

        <!-- Features Section -->
        <div class="row featurette">
            <div class="col-md-6 order-md-2">
                <h2 class="featurette-heading">El lugar ideal para destacar el <span class="text-muted">potencial de tu belleza.</span></h2>
                <p class="lead">En nuestro salón queremos ayudarte a alcanzar el mayor potencial de tu belleza. Pónte en manos expertas y realiza tus sueños en cuanto a imagen se refiere.</p>
            </div>
            <div class="col-lg-6">
                <img class="img-fluid rounded" src="img/estilista1.jpg" alt="Generic placeholder image">
            </div>
        </div>
        
        <hr class="featurette-divider">
        
        <div class="row featurette">
            <div class="col-lg-6">
                <h2>Contamos con múltiples servicios, entre los cuales están:</h2>
                <ul>
                    <li>Premiun MakeUp de día.</li>
                    <li>Esmalte Natural en manos.</li>
                    <li>Acrilico y gel en manos.</li>
                    <li>Peinado recogido</li>
                    <li>Estilizado de extenciones.</li>
                    <li>Un largo etc. !!!</li>
                </ul>
                <p>No dudes en acercarte a nosotros con dudas, comentarios y para cotizar sin compromiso.</p>
            </div>
            <div class="col-lg-6">
                <a href="#">
                    <img class="img-fluid rounded" src="img/estilista2.jpg" alt="Aplicaciones Web 2.0">
                </a>
            </div>
        </div>
        
        <br>
        <!-- end Features -->
    </div>
    <!-- end container -->
<%@include file="footer.jsp"%>