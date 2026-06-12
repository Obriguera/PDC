document.addEventListener('DOMContentLoaded', () => {
   ejecutarBusqueda();
});

document.getElementById('btnBuscar').addEventListener('click', () => {
    ejecutarBusqueda();
});

async function ejecutarBusqueda(){

    try {
        jUtils.clean('iError');
        jUtils.showLoading();

        const cadenaBusqueda = document.getElementById('txtBuscar').value;
        const ordenSeleccionado = document.querySelector('input[name="orden"]:checked').value

        const datos = new URLSearchParams({
            criterio: cadenaBusqueda,
            orden: ordenSeleccionado
        });

        const respuesta = await fetch('BuscarTickets', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: datos
        });

        if (!respuesta.ok) {
            const text = await respuesta.text();
            throw new Error(text || respuesta.statusText);
        }

        const resultado = await respuesta.text();

        document.getElementById('contenedorPrincipal').innerHTML = resultado;

    }
    catch (e) {
        jUtils.show("iError", e.message);
        console.error(e);
    }
    finally {
        jUtils.hideLoading();
    }
}