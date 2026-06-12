document.querySelectorAll('input[name="preguntaChasis"]').forEach(radio => {
    radio.addEventListener('change', function () {
        if (this.value === 'no') {
            jUtils.hide('seleccionVehiculo');
        } else {
            jUtils.show('seleccionVehiculo');
        }
    });
});


document.getElementById('chasis').addEventListener('blur', function(event) {
    verificarVehiculo(event.target, 'icono-chasis');
});

document.getElementById('patente').addEventListener('blur', function(event) {
    verificarVehiculo(event.target, 'icono-patente');
});

async function verificarVehiculo(inputElement, idIcono) {
    const valorChasis = document.getElementById('chasis').value.trim();
    const valorPatente = document.getElementById('patente').value.trim();
    const elementoIcono = document.getElementById(idIcono);

    // Si el chasis está vacío, no mandamos la petición (ya que el SP lo requiere siempre)
    if (valorChasis === "") return;

    try{
        jUtils.clean('iError');
        jUtils.showLoading();

        const datos = new URLSearchParams(
            {
                chasis: valorChasis,
                patente: valorPatente
        });

        const respuesta = await fetch('validar', {
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

        const existe = await respuesta.text();

        if(existe.trim() === 'S'){
            elementoIcono.src = 'imagenes/icon_ok.png';
            jUtils.show(idIcono);
        }
        else if (existe.trim() === 'N')
        {
            elementoIcono.src = 'imagenes/icon_wrong.png';
            jUtils.show(idIcono);
        }
    }
    catch (e) {
        jUtils.show("iError", e.message);
        console.error(e);
    }
    finally {
        jUtils.hideLoading();
    }
}

document.getElementById('iForm').addEventListener('submit', async (event) => {
    event.preventDefault();

    try{
        jUtils.clean('iError');
        jUtils.showLoading();

        const formDatos = new FormData(event.target);
        const datos = new URLSearchParams(formDatos);

        const respuesta = await fetch('carga', {
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

        if(resultado.trim() === 'OK'){
            document.body.innerHTML = `
                <div class="container text-center py-5">
                    <h3>¡Muchas gracias!</h3>
                    <p>Su reclamo ha sido registrado. Pronto será contactado por uno de nuestros asesores.</p>
                    <br>
                    <a href="index.jsp">Volver al formulario de carga</a>
                </div>
            `;
        }
        else{
            throw new Error("No se pudo abrir el reclamo. Intentelo Nuevamente")
        }
    }
    catch (e) {
        jUtils.show("iError", e.message);
        console.error(e);
    }
    finally {
        jUtils.hideLoading();
    }
})