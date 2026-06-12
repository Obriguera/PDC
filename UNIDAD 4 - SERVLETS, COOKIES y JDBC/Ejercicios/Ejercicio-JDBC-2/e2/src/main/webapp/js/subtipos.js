document.getElementById('iSelect').addEventListener('change', async (event) => {
    let valorSeleccionado = event.target.value;

    if (valorSeleccionado === "") {
        document.getElementById('contenedorTabla').innerHTML = "";
        return;
    }
    if (valorSeleccionado === "-1")
    {
        valorSeleccionado = "";
    }

        try {

            jUtils.clean("iError");
            jUtils.showLoading();

            const data = new URLSearchParams({codUnidadNegocio: valorSeleccionado});

            const response = await fetch("subtipos", {
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

            const htmlResuelto = await response.text();
            const tabla = document.getElementById('contenedorTabla');
            tabla.innerHTML = htmlResuelto;
        }
        catch (e) {
            jUtils.show("iError", e.message);
            console.log(e);
        }
        finally {
            jUtils.hideLoading();
        }
})

document.getElementById('contenedorTabla').addEventListener('click', async (event) => {

    if (event.target && event.target.id === 'btnCancelar')
    {
        console.log("Cancelando cambios, volviendo a consultar.");
        document.getElementById('iSelect').dispatchEvent(new Event('change'));
        return;
    }

    if (event.target && event.target.id === 'btnGuardar'){

        try {

            jUtils.clean("iError");
            jUtils.showLoading();

            const filas = document.querySelectorAll('#contenedorTabla tbody tr');

            const datosFormulario = new URLSearchParams();

            filas.forEach(fila => {
                const codTipo = fila.querySelector('.cod-tipo').value;
                const nroSubtipo = fila.querySelector('.nro-subtipo').value;
                const habilitado = fila.querySelector('.chk-habilitado').checked ? 'S' : 'N';

                datosFormulario.append('arrCodTipo', codTipo);
                datosFormulario.append('arrNroSubtipo', nroSubtipo);
                datosFormulario.append('arrHabilitado', habilitado);
            });

            const response = await fetch("GuardarSubtipos", {
                method: "POST",
                body: datosFormulario,
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                }
            });

            if(!response.ok) {
                const text = await response.text();
                throw new Error(text || response.statusText);
            }

            console.log("Guardado exitoso.");
            window.location.reload();
        }
        catch (e) {
            jUtils.show("iError", e.message);
            console.log(e);
        }
        finally {
            jUtils.hideLoading();
        }

    }
})