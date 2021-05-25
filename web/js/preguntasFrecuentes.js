// Traemos todas las preguntas con la clase .contenedor-pregunta
const preguntas = document.querySelectorAll('.preguntas .contenedor-pregunta');

// Agregamos un EventListener por cada pregunta que tenemos
preguntas.forEach((pregunta) => {
    pregunta.addEventListener('click', (e) => {
        e.currentTarget.classList.toggle('activa');
    });
});