// Traemos todas las pedidos con la clase .contenedor-pedido
const pedidos = document.querySelectorAll('.pedidos .contenedor-pedido');

// Agregamos un EventListener por cada pedido que tenemos
pedidos.forEach((pedido) => {
    pedido.addEventListener('click', (e) => {
        e.currentTarget.classList.toggle('activa');
    });
});