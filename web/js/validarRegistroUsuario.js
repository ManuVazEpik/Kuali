
function validar(){
    console.log("Simon")
    var nom_usu = document.formRegistroUsuario.nom_usu.value;
    var appat_usu = document.formRegistroUsuario.appat_usu.value;
    var apmat_usu = document.formRegistroUsuario.apmat_usu.value;
    var tel_usu = document.formRegistroUsuario.tel_usu.value;
    var email_usu= document.formRegistroUsuario.email_usu.value;
    var pass_usu= document.formRegistroUsuario.pass_usu.value;
    var tipo= document.formRegistroUsuario.tipo.value;
    
    var expresion1=new RegExp("^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");//correo
    var expresion2= /^\d*$/;//numeros
    var expresion3 = new RegExp("^[a-zA-ZÀ-ÿ0-9\\u00f1\\u00d1\\?\\¿\\!\\¡.#$%&*+/=?_;{|}~-]+(\\s*[a-zA-ZÀ-ÿ0-9\\u00f1\\u00d1\\?\\¿\\!\\¡.#$%&*+/=?_;{|}~-]*)*[a-zA-ZÀ-ÿ0-9\\u00f1\\u00d1\\?\\¿\\!\\¡.#$%&*+/=?_;{|}~-]+$");//letras y espacios
    var expresion4 = new RegExp("^[a-zA-ZÀ-ÿ\\u00f1\\u00d1]+(\\s*[a-zA-ZÀ-ÿ\\u00f1\\u00d1]*)*[a-zA-ZÀ-ÿ\\u00f1\\u00d1]+$");
    var expresion5 = new RegExp("^[a-zA-ZÀ-ÿ\\u00f1\\u00d1]*[a-zA-ZÀ-ÿ\\u00f1\\u00d1][a-zA-ZÀ-ÿ\\u00f1\\u00d1]+$");
    var expresion6 = new RegExp("^[a-zA-Z0-9\\u00f1\\u00d1\\?\\¿\\!\\¡.#$%&*+/=?_;{|}~-]*[a-zA-Z0-9\\u00f1\\u00d1\\?\\¿\\!\\¡.#$%&*+/=?_;{|}~-][a-zA-Z0-9\\u00f1\\u00d1\\?\\¿\\!\\¡.#$%&*+/=?_;{|}~-]+$");
    
    var exp1=expresion4.test(nom_usu);
    var exp2=expresion4.test(appat_usu);
    var exp3=expresion4.test(apmat_usu);
    var exp4=expresion2.test(tel_usu);
    var exp5=expresion1.test(email_usu);
    var exp6=expresion6.test(pass_usu);
    
    if (nom_usu=="" || appat_usu=="" || apmat_usu=="" || tel_usu=="" || email_usu=="" || pass_usu=="" || tipo=="") {
        alert("No deje campos vacios");
        return false;
    }else{
        if(exp1===false){
            alert("El nombre puede contener letras y espacios (solo si hay letras delante), ingresa mas de un caracter");
            return false;
        }else if(exp2===false || exp3==false){
            alert("Los apellidos puede contener letras y espacios (solo si hay letras delante), ingresa mas de un caracter");
            return false;
        }else if(exp4===false){
            alert("El telefono solo puede contener números enteros");
            return false;
        }else if(exp5===false){
            alert("El correo es inválido");
            return false;
        }else if(exp6===false){
            alert("La contraseña puede contener algunos caracteres especiales, exceptuando comillas y acentos. Debe de tener de 5 a 20 caracteres");
            return false;
        }else{
            if (tipo!="Cliente" && tipo!="Dueño" ) {
                alert("No cambies nada > : v");
                return false;
            }else{
                var lonom_usu=nom_usu.length;
                var loappat_usu=appat_usu.length;
                var loapmat_usu=apmat_usu.length;
                var lotel_usu=tel_usu.length;
                var loemail_usu=email_usu.length;
                var lopass_usu=pass_usu.length;
                
                if (lonom_usu>20) {
                    alert("El nombre no puede contener mas de 45 caracteres");
                    return false;
                }else if (loappat_usu>30 || loapmat_usu>30) {
                    alert("Los apellidos no pueden tener mas de 30 carácteres");
                    return false;
                }else if(lotel_usu!==10){
                    alert("El teléfono debe de tener 10 dígitos");
                    return false;
                }else if(loemail_usu>=50) {
                    alert("El correo no debe de revasar los 50 caracteres");
                    return false;
                }else if(lopass_usu<5 || lopass_usu>20) {
                    alert("La contraseña debe de tener de 5 a 20 caracteres");
                    return false;
                }else{
                    alert("Registro exitoso");
                    return true;
                }
            }
            
        }
    }
}

