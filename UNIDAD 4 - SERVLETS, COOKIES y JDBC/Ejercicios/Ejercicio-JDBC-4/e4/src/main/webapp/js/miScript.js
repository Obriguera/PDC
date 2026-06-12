document.getElementById('iForm').addEventListener('submit', async(event) => {

    try {
        event.preventDefault();

        jUtils.clean("iError");
        jUtils.showLoading();

        const data = new FormData(event.target);


        const response = await fetch("agregarProducto", {
            method: "POST",
            body: new URLSearchParams(data),
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            }
        });

        if(!response.ok) {
            const text = await response.text();
            throw new Error(text || response.statusText);
        }

        const respuestaHTML = await response.text();
        document.getElementById('misProductos').insertAdjacentHTML('beforeend', respuestaHTML);
        actualizarPrecioTotal();
        actualizarPanelDerecho();
    }
    catch (e) {
        jUtils.show("iError", e.message);
        console.log(e);
    }
    finally {
        jUtils.hideLoading();
    }

});

function actualizarPrecioTotal() {
    let total = 0.0;

    // Buscamos todos los celdas de precio que tengan esa clase
    const celdasPrecio = document.querySelectorAll('#misProductos .lbl-precio');

    celdasPrecio.forEach(celda => {
        // Limpiamos el "$" y los espacios, y convertimos a número
        let textoPrecio = celda.innerText.replace('$', '').trim();
        if (textoPrecio) {
            total += parseFloat(textoPrecio);
        }
    });

    document.getElementById('precioTotal').innerText = `$${total.toFixed(2)}`;
}

document.getElementById('misProductos').addEventListener('click', async (event) => {

    // 1. Verificamos si el clic fue en el botón de eliminar o su ícono interno
    const btnEliminar = event.target.closest('.btn-outline-danger');
    if (!btnEliminar) return;

    // 2. Capturamos la fila entera y extraemos el ID que le pusiste
    const fila = btnEliminar.closest('tr');
    const nroDetalle = fila.dataset.detalle;

    try {

        jUtils.clean("iError");
        jUtils.showLoading();

        const data = new URLSearchParams();
        data.append('nroDetalle', nroDetalle);


        const response = await fetch("eliminarProducto", {
            method: "POST",
            body: data,
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            }
        });

        if(!response.ok) {
            const text = await response.text();
            throw new Error(text || response.statusText);
        }

        fila.remove();
        actualizarPrecioTotal();
        actualizarPanelDerecho();
    }
    catch (e) {
        jUtils.show("iError", e.message);
        console.log(e);
    }
    finally {
        jUtils.hideLoading();
    }
})

function actualizarPanelDerecho() {
    // Buscamos el contenedor de las filas
    const tbody = document.getElementById('misProductos');

    // Obtenemos el último <tr> que quedó en la tabla
    const ultimaFila = tbody.lastElementChild;

    // Regla de negocio: Si no hay productos, el monto es 0 y descripción vacía
    if (!ultimaFila) {
        document.getElementById('panelUltimoPrecio').innerText = '$0.00';
        document.getElementById('panelUltimoNombre').innerText = '';
        document.getElementById('panelUltimoBarra').innerText = '';
        return; // Cortamos la ejecución acá
    }

    // Si todavía quedan productos, leemos los datos de la que ahora es la última fila
    const precio = parseFloat(ultimaFila.dataset.precio);
    const nombre = ultimaFila.dataset.nombre;
    const barra = ultimaFila.dataset.barra;

    // Actualizamos la interfaz gráfica con los datos frescos
    document.getElementById('panelUltimoPrecio').innerText = `$${precio.toFixed(2)}`;
    document.getElementById('panelUltimoNombre').innerText = nombre;
    document.getElementById('panelUltimoBarra').innerText = barra;
}

// Interceptamos la pulsación de teclas en toda la ventana
document.addEventListener('keydown', async (event) => {

    // Verificamos si la tecla presionada fue F5
    if (event.key === 'F5') {

        // 1. Evitamos el comportamiento por defecto del navegador (que es recargar toda la página)
        event.preventDefault();

        try {
            jUtils.showLoading();

            // 2. Invocamos al Servlet para traer todo el carrito (usamos GET porque es solo lectura)
            const response = await fetch("consultarCarrito", {
                method: "GET"
            });

            if (!response.ok) {
                const text = await response.text();
                throw new Error(text || 'Error al reconstruir la tabla.');
            }

            const respuestaHTML = await response.text();

            // 3. Reemplazamos TODO el contenido del tbody con las nuevas filas
            // Acá usamos innerHTML en lugar de insertAdjacentHTML porque queremos limpiar lo viejo y poner lo nuevo
            document.getElementById('misProductos').innerHTML = respuestaHTML;

            // 4. Recalculamos el total y mostramos el último producto
            actualizarPrecioTotal();
            actualizarPanelDerecho();

        } catch (e) {
            document.getElementById('lblMensajeError').innerText = e.message;
            const miModal = new bootstrap.Modal(document.getElementById('modalError'));
            miModal.show();
        } finally {
            jUtils.hideLoading();
        }
    }
});