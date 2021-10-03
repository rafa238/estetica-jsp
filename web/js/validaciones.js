function validaNumericos(event) {
    if(event.charCode >= 48 && event.charCode <= 57){
      return true;
    }

    return false;        
}

function validaNumericos(event) {
    if(event.charCode >= 48 && event.charCode <= 57){
      return true;
    }

    return false;        
}

function validaNumericos2(elemento) {
	if(elemento.value!==''){
    	var data = elemento.value;
        
        if(isNaN(data)){
            elemento.className='form-control alert-danger';
        }else{
            elemento.className='form-control';
        }
    }      
}

function revisaLongitud(elemento, min){
    if(elemento.value!==''){ 
        var data = elemento.value;
        if(data.length<min){
            elemento.className='form-control alert-danger';
        }else{
            elemento.className='form-control';
        }
    }
}

function revisaNumero(elemento){
    if(elemento.value!==''){
        var data = elemento.value;
        if(isNaN(data)){
            elemento.className='form-control alert-danger';
        }else{
            elemento.className='form-control';
        }
    }
}

function revisarEmail(elemento){
    if(elemento.value!==''){
        var data = elemento.value;
        var exp = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        if(!exp.test(data)){
            elemento.className='form-control alert-danger';
        }else{
            elemento.className='form-control';
        }	
    }
}

function validar(){
    var datosCorrectos=true;
    var error="";
    
    if(document.getElementById("nombre").value===""){
        datosCorrectos=false;
        console.log("ola");
        document.getElementById("nombremal").value="Porfavor pon un nombre valido";
    }
/*
    if(document.getElementById("telefono").value==""){
        datosCorrectos=false;
        error="\n Debes Poner Un Tenelefono";
    }

    if(isNaN(document.getElementById("telefono").value)){
        datosCorrectos=false;
        error="\n El Telefono Solo Debe Tener Numeros";
    }

    var exp = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if(!exp.test(document.getElementById("email").value)){
        datosCorrectos=false;
        error="\n Email Invalido";
    }

    if(document.getElementById("mensaje").value.length<30){
        datosCorrectos=false;
        error="\n El Mensaje Debe Ser Mayor A 30 Caracteres";
    }

    if(!datosCorrectos){
        alert('Hay Errores En El formulario'+error);
    }

    return datosCorrectos;*/
}

function revisar(elemento){
    if(elemento.value===""){
            elemento.className='form-control alert-danger';
    }else{
        elemento.className='form-control';
    }
}