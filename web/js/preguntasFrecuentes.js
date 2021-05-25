const preguntas = document.querySelectorAll('button');

function desplegarPregunta() {
    const respuestas = document.querySelectorAll('.respuesta');

    for (i = 0; i < respuestas.length; i++) {
        const estadoPregunta = respuestas[i].getAttribute('respuesta-desplegada');
      
        if (estadoPregunta == 'false') {
          respuesta[i].setAttribute('respuesta-desplegada', 'true');
          
          //Cambiar el icono de la pregunta      
        }
        else if(estadoPregunta == 'true') {
          respuestas[i].setAttribute('respuesta-desplegada', 'false');
        }
        else
          console.log('Valio barriga Sr verga xd');
    }
}

preguntas.forEach(pregunta => pregunta.addEventListener('click', desplegarPregunta));

const items = document.querySelectorAll(".accordion button");

function toggleAccordion() {
  const itemToggle = this.getAttribute('aria-expanded');
  
  for (i = 0; i < items.length; i++) {
    items[i].setAttribute('aria-expanded', 'false');
  }
  
  if (itemToggle == 'false') {
    this.setAttribute('aria-expanded', 'true');
  }
}

items.forEach(item => item.addEventListener('click', toggleAccordion));