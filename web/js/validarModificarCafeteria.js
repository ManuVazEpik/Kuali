
function validar(){
    console.log("Simon")
    var nom_caf = document.formModificarCafeteria.nom_caf.value;
    var dir_caf = document.formModificarCafeteria.dir_caf.value;
    var fot_caf = document.formModificarCafeteria.fot_caf.value;
    
    var expresion1=new RegExp("^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");//correo
    var expresion2= /^\d*$/;//numeros
    var expresion3 = new RegExp("^[a-zA-ZÀ-ÿ0-9\\u00f1\\u00d1\\?\\¿\\!\\¡.#$%&*+/=?_;{|}~-]+(\\s*[a-zA-ZÀ-ÿ0-9\\u00f1\\u00d1\\?\\¿\\!\\¡.#$%&*+/=?_;{|}~-]*)*[a-zA-ZÀ-ÿ0-9\\u00f1\\u00d1\\?\\¿\\!\\¡.#$%&*+/=?_;{|}~-]+$");//letras y espacios
    var expresion4 = new RegExp("^[a-zA-ZÀ-ÿ\\u00f1\\u00d1]+(\\s*[a-zA-ZÀ-ÿ\\u00f1\\u00d1]*)*[a-zA-ZÀ-ÿ\\u00f1\\u00d1]+$");
    var expresion5 = new RegExp("^[a-zA-ZÀ-ÿ\\u00f1\\u00d1]*[a-zA-ZÀ-ÿ\\u00f1\\u00d1][a-zA-ZÀ-ÿ\\u00f1\\u00d1]+$");
    var expresion6 = new RegExp("^[a-zA-Z0-9\\u00f1\\u00d1\\?\\¿\\!\\¡.#$%&*+/=?_;{|}~-]*[a-zA-Z0-9\\u00f1\\u00d1\\?\\¿\\!\\¡.#$%&*+/=?_;{|}~-][a-zA-Z0-9\\u00f1\\u00d1\\?\\¿\\!\\¡.#$%&*+/=?_;{|}~-]+$");
    
    var exp1=expresion3.test(nom_caf);
    var exp2=expresion3.test(dir_caf);
    var exp3 = confirmarURL(fot_caf);
    console.log("Confirma"+exp3);
    
    if (nom_caf=="" || dir_caf=="" || fot_caf=="") {
        alert("No deje campos vacios");
        return false;
    }else{
        if(exp1===false){
            alert("El nombre de la cafeteria no puede contener comillas o algunos otros caracteres especiales, favor de evitar acabar la queja con algún espacio ");
            return false;
        }else if(exp2===false ){
            alert("La dirección de la cafeteria no puede contener comillas o algunos otros caracteres especiales, favor de evitar acabar la queja con algún espacio ");
            return false;
        }else if(exp3===false){
            alert("La colonia de la cafeteria no puede contener comillas o algunos otros caracteres especiales, favor de evitar acabar la queja con algún espacio ");
            return false;
        }else{

            var lonom_caf=nom_caf.length;
            var lodir_caf=dir_caf.length;
            var lofot_caf=fot_caf.length;

            if (lonom_caf>20) {
                alert("El nombre no puede contener mas de 20 carácteres");
                return false;
            }else if (lodir_caf>300 ) {
                alert("La calle no pueden tener mas de 30 carácteres");
                return false;
            }else if(lofot_caf>=1000) {
                alert("La url de la img de la cafeteria es demasiado extensa");
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

