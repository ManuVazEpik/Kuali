
function validar(){
    console.log("Simon")
    var email_usu= document.formInicioSesion.corU.value;
    var pass_usu= document.formInicioSesion.conU.value;
    
    var expresion1=new RegExp("^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");//correo
    var expresion2= /^\d*$/;//numeros
    var expresion3 = new RegExp("^[a-zA-ZÀ-ÿ0-9\\u00f1\\u00d1\\?\\¿\\!\\¡.#$%&*+/=?_;{|}~-]+(\\s*[a-zA-ZÀ-ÿ0-9\\u00f1\\u00d1\\?\\¿\\!\\¡.#$%&*+/=?_;{|}~-]*)*[a-zA-ZÀ-ÿ0-9\\u00f1\\u00d1\\?\\¿\\!\\¡.#$%&*+/=?_;{|}~-]+$");//letras y espacios
    var expresion4 = new RegExp("^[a-zA-ZÀ-ÿ\\u00f1\\u00d1]+(\\s*[a-zA-ZÀ-ÿ\\u00f1\\u00d1]*)*[a-zA-ZÀ-ÿ\\u00f1\\u00d1]+$");
    var expresion5 = new RegExp("^[a-zA-ZÀ-ÿ\\u00f1\\u00d1]*[a-zA-ZÀ-ÿ\\u00f1\\u00d1][a-zA-ZÀ-ÿ\\u00f1\\u00d1]+$");
    var expresion6 = new RegExp("^[a-zA-Z0-9\\u00f1\\u00d1\\?\\¿\\!\\¡.#$%&*+/=?_;{|}~-]*[a-zA-Z0-9\\u00f1\\u00d1\\?\\¿\\!\\¡.#$%&*+/=?_;{|}~-][a-zA-Z0-9\\u00f1\\u00d1\\?\\¿\\!\\¡.#$%&*+/=?_;{|}~-]+$");
    
    var exp1=expresion1.test(email_usu);
    var exp2=expresion6.test(pass_usu);
    
    if (email_usu=="" || pass_usu=="" ) {
        alert("No deje campos vacíos");
        return false;
    }else{
        if(exp1===false){
            alert("El correo es inválido");
            return false;
        }else if(exp2===false){
            alert("La contraseña puede contener algunos caracteres especiales, exceptuando comillas y acentos. Debe de tener de 5 a 20 caracteres");
            return false;
        }else{
            var loemail_usu=email_usu.length;
            var lopass_usu=pass_usu.length;

            if (loemail_usu>=50) {
                alert("El correo no debe de revasar los 50 caracteres");
                return false;
            }else if(lopass_usu<5 || lopass_usu>20) {
                alert("La contraseña debe de tener de 5 a 20 caracteres");
                return false;
            }else{
                
                return true;
            }
            
            
        }
    }
}

