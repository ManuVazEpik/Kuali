//Importamos la funcion de filtroBusqueda
import filtroBusqueda from './filtroBusqueda.js';

// Traemos todas las preguntas con la clase .contenedor-pregunta
const preguntas = document.querySelectorAll('.preguntas .contenedor-pregunta');

// Agregamos un EventListener por cada pregunta que tenemos
preguntas.forEach((pregunta) => {
    pregunta.addEventListener('click', (e) => {
        e.currentTarget.classList.toggle('activa');
    });
});

//Llamamos a la funcion filtroBusqueda para usuarios y cafeterias
filtroBusqueda('.faq_usuarios .card-filter', '.faq_usuarios .pregunta');
filtroBusqueda('.faq_cafeterias .card-filter', '.faq_cafeterias .pregunta');