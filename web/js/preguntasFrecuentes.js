const preguntas = document.querySelectorAll('button');

function desplegarPregunta() {
    const estadoPregunta = this.getAttribute('respuesta-desplegada');

    for (i = 0; i < preguntas.length; i++) {
        preguntas[i].setAttribute('respuesta-desplegada', 'false');
      }

    if (estadoPregunta == 'false') {
    this.setAttribute('respuesta-desplegada', 'true');
    
    //Cambiar el icono de la pregunta

    }
}

preguntas.forEach(pregunta => pregunta.addEventListener('click', desplegarPregunta));
