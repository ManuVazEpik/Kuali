
function validar(){
    console.log("Simon")
    var nom_caf = document.formRegistroCafeteria.nom_caf.value;
    var calle_caf = document.formRegistroCafeteria.calle_caf.value;
    var col_caf = document.formRegistroCafeteria.col_caf.value;
    var num_caf = document.formRegistroCafeteria.num_caf.value;
    var fot_caf= document.formRegistroCafeteria.fot_caf.value;
    
    var expresion1=new RegExp("^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");//correo
    var expresion2= /^\d*$/;//numeros
    var expresion3 = new RegExp("^[a-zA-ZÀ-ÿ0-9\\u00f1\\u00d1\\?\\¿\\!\\¡.#$%&*+/=?_;{|}~-]+(\\s*[a-zA-ZÀ-ÿ0-9\\u00f1\\u00d1\\?\\¿\\!\\¡.#$%&*+/=?_;{|}~-]*)*[a-zA-ZÀ-ÿ0-9\\u00f1\\u00d1\\?\\¿\\!\\¡.#$%&*+/=?_;{|}~-]+$");//letras y espacios
    var expresion4 = new RegExp("^[a-zA-ZÀ-ÿ\\u00f1\\u00d1]+(\\s*[a-zA-ZÀ-ÿ\\u00f1\\u00d1]*)*[a-zA-ZÀ-ÿ\\u00f1\\u00d1]+$");
    var expresion5 = new RegExp("^[a-zA-ZÀ-ÿ\\u00f1\\u00d1]*[a-zA-ZÀ-ÿ\\u00f1\\u00d1][a-zA-ZÀ-ÿ\\u00f1\\u00d1]+$");
    var expresion6 = new RegExp("^[a-zA-Z0-9\\u00f1\\u00d1\\?\\¿\\!\\¡.#$%&*+/=?_;{|}~-]*[a-zA-Z0-9\\u00f1\\u00d1\\?\\¿\\!\\¡.#$%&*+/=?_;{|}~-][a-zA-Z0-9\\u00f1\\u00d1\\?\\¿\\!\\¡.#$%&*+/=?_;{|}~-]+$");
    
    var exp1=expresion3.test(nom_caf);
    var exp2=expresion3.test(calle_caf);
    var exp3=expresion3.test(col_caf);
    var exp4=expresion2.test(num_caf);
    
    var exp5 = confirmarURL(fot_caf);
    console.log("Confirma"+exp5);
    
    if (nom_caf=="" || calle_caf=="" || col_caf=="" || num_caf=="" ) {
        alert("No deje campos vacios");
        return false;
    }else{
        if(exp1===false){
            alert("El nombre de la cafeteria no puede contener comillas o algunos otros caracteres especiales, favor de evitar acabar la queja con algún espacio ");
            return false;
        }else if(exp2===false ){
            alert("La calle de la cafeteria no puede contener comillas o algunos otros caracteres especiales, favor de evitar acabar la queja con algún espacio ");
            return false;
        }else if(exp3===false){
            alert("La colonia de la cafeteria no puede contener comillas o algunos otros caracteres especiales, favor de evitar acabar la queja con algún espacio ");
            return false;
        }else if(exp4===false){
            alert("El número de la dirección de la cafeteria debe contener unicamente dígitos");
            return false;
        }else if(exp5===false){
            alert("La dirección URL debe de empezar con https:// y acabar con .jpg o .png");
            return false;
        }else{

            var lonom_caf=nom_caf.length;
            var localle_caf=calle_caf.length;
            var locol_caf=col_caf.length;
            var lonum_caf=num_caf.length;
            var lofot_caf=fot_caf.length;

            if (lonom_caf>20) {
                alert("El nombre no puede contener mas de 45 caracteres");
                return false;
            }else if (localle_caf>30 ) {
                alert("La calle no pueden tener mas de 30 carácteres");
                return false;
            }else if(locol_caf>30){
                alert("La colonia no pueden tener mas de 30 carácteres");
                return false;
            }else if(lonum_caf>=4) {
                alert("El número de la cafeteria no puede tener más de 3 dígitos");
                return false;
            }else if(lofot_caf>=1000) {
                alert("La url de la cafeteria es demasiado extensa");
                return false;
            }else{
                alert("Registro exitoso");
                return true;
            }
            
            
        }
    }
}

function confirmarURL(parametro){
    var fot_caf=parametro;
    var delante="";
    var atras="";
    for (var i = 0; i < 8; i++) {
        delante+=fot_caf.charAt(i);
    }
    for (var i = fot_caf.length-4; i < fot_caf.length; i++) {
        atras+=fot_caf.charAt(i);
    }
    if (delante!=="https://" || (atras!==".jpg" && atras!==".png")) {
        return false;
    }else{
        return true;
    }
    console.log(delante);
    console.log(atras);
}

