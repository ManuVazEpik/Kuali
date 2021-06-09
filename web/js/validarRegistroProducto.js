
function validar(){
    console.log("Simon")
    var nom_prod = document.formRegistroProducto.nom_prod.value;
    var desc_prod = document.formRegistroProducto.desc_prod.value;
    var pre_prod = document.formRegistroProducto.pre_prod.value;
    var fot_prod = document.formRegistroProducto.fot_prod.value;
    
    var expresion1=new RegExp("^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");//correo
    var expresion2= /^\d*$/;//numeros
    var expresion3 = new RegExp("^[a-zA-ZÀ-ÿ0-9\\u00f1\\u00d1\\?\\¿\\!\\¡.#$%&*+/=?_;{|}~-]+(\\s*[a-zA-ZÀ-ÿ0-9\\u00f1\\u00d1\\?\\¿\\!\\¡.#$%&*+/=?_;{|}~-]*)*[a-zA-ZÀ-ÿ0-9\\u00f1\\u00d1\\?\\¿\\!\\¡.#$%&*+/=?_;{|}~-]+$");//letras y espacios
    var expresion4 = new RegExp("^[a-zA-ZÀ-ÿ\\u00f1\\u00d1]+(\\s*[a-zA-ZÀ-ÿ\\u00f1\\u00d1]*)*[a-zA-ZÀ-ÿ\\u00f1\\u00d1]+$");
    var expresion5 = new RegExp("^[a-zA-ZÀ-ÿ\\u00f1\\u00d1]*[a-zA-ZÀ-ÿ\\u00f1\\u00d1][a-zA-ZÀ-ÿ\\u00f1\\u00d1]+$");
    var expresion6 = new RegExp("^[a-zA-Z0-9\\u00f1\\u00d1\\?\\¿\\!\\¡.#$%&*+/=?_;{|}~-]*[a-zA-Z0-9\\u00f1\\u00d1\\?\\¿\\!\\¡.#$%&*+/=?_;{|}~-][a-zA-Z0-9\\u00f1\\u00d1\\?\\¿\\!\\¡.#$%&*+/=?_;{|}~-]+$");
    var expresion7 = new RegExp("^[0-9]+([\\.][0-9]+)?$");
    
    var exp1=expresion3.test(nom_prod);
    var exp2=expresion3.test(desc_prod);
    var exp3=expresion7.test(pre_prod);
    var exp4=confirmarURL(fot_prod);
    
    console.log("Confirma"+exp4);
    
    if (nom_prod=="" || desc_prod=="" || pre_prod=="" || fot_prod=="" ) {
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
        }else{

            var lonom_prod=nom_prod.length;
            var lodesc_prod=desc_prod.length;
            var lopre_prod=pre_prod.length;
            var lofot_prod=fot_prod.length;

            if (lonom_prod>20) {
                alert("El nombre no puede contener mas de 45 caracteres");
                return false;
            }else if (lodesc_prod>100 ) {
                alert("La calle no pueden tener mas de 30 carácteres");
                return false;
            }else if(lopre_prod>30){
                alert("La colonia no pueden tener mas de 30 carácteres");
                return false;
            }else if(lofot_prod>=1000) {
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



