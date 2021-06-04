/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function satisfaccion1(){
    
    document.querySelector('.caras').innerHTML = '<input type="hidden" value="3" name="satisfaccion"/><button onclick="return satisfaccion1()"><i class="far fa-grin-beam fa-10x"></i></button><button onclick="return satisfaccion2()"><i class="far fa-meh fa-10x"></i></button><button onclick="return satisfaccion3()"><i class="far fa-angry fa-10x"></i></button>';
    return false;
}
function satisfaccion2(){
    
    document.querySelector('.caras').innerHTML = '<input type="hidden" value="2" name="satisfaccion"/><button onclick="return satisfaccion1()"><i class="far fa-grin-beam fa-10x"></i></button><button onclick="return satisfaccion2()"><i class="far fa-meh fa-10x"></i></button><button onclick="return satisfaccion3()"><i class="far fa-angry fa-10x"></i></button>';
    return false;
}
function satisfaccion3(){
    
    document.querySelector('.caras').innerHTML = '<input type="hidden" value="1" name="satisfaccion"/><button onclick="return satisfaccion1()"><i class="far fa-grin-beam fa-10x"></i></button><button onclick="return satisfaccion2()"><i class="far fa-meh fa-10x"></i></button><button onclick="return satisfaccion3()"><i class="far fa-angry fa-10x"></i></button>';
    return false;
}

function validar(){
    console.log("Simon")
    var nombre = document.formqueja.nombre.value;
    var correo = document.formqueja.correo.value;
    var tel = document.formqueja.tel.value;
    var queja = document.formqueja.queja.value;
    var satis= document.formqueja.satisfaccion.value;
    
    var expresion1=new RegExp("^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");//correo
    var expresion2= /^\d*$/;//numeros
    var expresion3 = new RegExp("^[a-zA-ZÀ-ÿ0-9\\u00f1\\u00d1\\?\\¿\\!\\¡.#$%&*+/=?_;{|}~-]+(\\s*[a-zA-ZÀ-ÿ0-9\\u00f1\\u00d1\\?\\¿\\!\\¡.#$%&*+/=?_;{|}~-]*)*[a-zA-ZÀ-ÿ0-9\\u00f1\\u00d1\\?\\¿\\!\\¡.#$%&*+/=?_;{|}~-]+$");//letras y espacios
    var expresion4 = new RegExp("^[a-zA-ZÀ-ÿ\\u00f1\\u00d1]+(\\s*[a-zA-ZÀ-ÿ\\u00f1\\u00d1]*)*[a-zA-ZÀ-ÿ\\u00f1\\u00d1]+$");
    
    var exp1=expresion4.test(nombre);
    var exp2=expresion1.test(correo);
    var exp3=expresion2.test(tel);
    var exp4=expresion3.test(queja);
    var exp5=expresion2.test(satis);
    
    if (nombre=="" || correo=="" || tel=="" || queja=="" ) {
        alert("No deje campos vacios");
        return false;
    }else if(satis==="0"){
        alert("Por favor, selecciona una de las caritas de la derecha");
        return false;
    }else{
        if(exp1===false){
            alert("El nombre puede contener letras y espacios (solo si hay letras delante), ingresa mas de un caracter");
            return false;
        }else if(exp2===false ){
            alert("El correo es inválido");
            return false;
        }else if(exp3===false){
            alert("El telefono solo puede contener números enteros");
            return false;
        }else if(exp4===false){
            alert("La queja no puede contener comillas o algunos otros caracteres especiales, favor de evitar acabar la queja con algún espacio ");
            return false;
        }else if(exp5===false){
            alert("No cambies nada > : v");
            return false;
        }else{
            if (satis!="1" && satis!="2" && satis!="3" && satis!="0") {
                alert("No cambies nada > : v");
                return false;
            }else{
                var lonombre=nombre.length;
                var locorreo=correo.length;
                var lotel=tel.length;
                var loqueja=queja.length;
                
                if (lonombre>45) {
                    alert("El nombre no puede contener mas de 45 caracteres");
                    return false;
                }else if (locorreo>45 ) {
                    alert("El correo no puede tener mas de 45 carácteres");
                    return false;
                }else if(lotel!==10){
                    alert("El teléfono debe de tener 10 dígitos");
                    return false;
                }else if(loqueja>500) {
                    alert("La queja o sugerencia no debe revesar los 500 carácteres");
                    return false;
                }else{
                    alert("Se ha registrado su queja/sugerencia :)");
                    return true;
                }
            }
            
        }
    }
}