//Creamos una función por defecto para las búsquedas
    export default function filtroBusqueda(input, selector) {
    //EventListener si levantamos la tecla
    document.addEventListener('keyup', (tecla) => {
        if (tecla.target.matches(input)) {
            
            console.log(tecla.target.value);

            if (tecla.key === 'esc') { e.target.value = "" }

            document.querySelectorAll(selector).forEach((element) =>
                //Convertimos la entrada a minusculas
                element.textContent.toLowerCase().includes(tecla.target.value)
                    //Evaluamos si se cumple o no y agregamos o quitamos la clase filter
                    ? element.classList.remove('filter')
                    : element.classList.add('filter')
            );
        }
    });
}