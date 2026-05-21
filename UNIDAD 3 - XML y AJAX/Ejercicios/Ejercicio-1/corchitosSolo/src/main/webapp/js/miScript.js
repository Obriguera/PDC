document.getElementById('iForm').addEventListener('submit', async (event) =>{
    event.preventDefault();

    try{
        jUtils.clean("iError");
        jUtils.showLoading();

        const cantidadJugadores = document.querySelectorAll('.form-control');

        if (cantidadJugadores.length >= 2){
            jUtils.show('btnSorteo');
        }

        const  formDatos = new FormData(event.target);
        const datos = new URLSearchParams(formDatos);

        const respuesta = await fetch('getLine.jsp',
            {
                method: "POST",
                headers:{'Content-Type': 'application/x-www-form-urlencoded'},
                body: datos
            });

        if (!respuesta.ok){
            throw  new Error("Error al agregar participante")
        }

        const HTMLrespuesta = await respuesta.text();

        const entradas = document.getElementById("entradasUsuarios");
        entradas.insertAdjacentHTML("beforeend", HTMLrespuesta);
    }
    catch (error)
    {
        jUtils.show('iError', error.message);
    }
    finally {
        jUtils.hideLoading();
    }
})

async function sortear(){

    const participantes = document.querySelectorAll('#entradasUsuarios td input');

    for (let i = 0; i < participantes.length; i++){
        if (participantes[i].value.trim() === ""){
            jUtils.show('iError', "Faltan llenar los nombre de algunos usuarios");
            return;
        }
    }

    jUtils.hide('btnAgregar');
    participantes.forEach(input => input.readOnly = true);

    try{
        const participantesActivos = document.querySelectorAll('#entradasUsuarios tr:not(.eliminado)');
        const cantidadActivos = participantesActivos.length;

        if (cantidadActivos < 3){
            jUtils.show('iError', 'Ya no quedan más personas para sortear, solo quedan 2');
            jUtils.hide('btnSorteo');
            jUtils.show('btnReiniciar')
            return;
        }

        jUtils.showLoading();

        const datos = new URLSearchParams({
            cantidad : cantidadActivos
        })

        const respuesta = await fetch('sortear.jsp', {method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: datos});

        if(!respuesta.ok)
        {
            const detalle = await respuesta.text();
            throw new Error(`Error ${respuesta.status}: ${detalle}`);
        }

        const indiceTexto = await respuesta.text();
        const indice = parseInt(indiceTexto.trim());

        const filaAEliminar =participantesActivos[indice];
        filaAEliminar.classList.add('eliminado');

    }
    catch (error)
    {
        jUtils.show('iError', error.message);
    }
    finally {
        jUtils.hideLoading();
    }

}

function reiniciar(){
    location.reload();

}