document.getElementById("iForm").addEventListener('submit', async(event) => {
    event.preventDefault();


    try{
        jUtils.clean('iError')
        jUtils.showLoading();

        const formDatos = new FormData(event.target);
        const datos = new URLSearchParams(formDatos);

        const respuesta = await fetch('./getLine.jsp', {method: 'POST', headers: {'Content-Type': 'application/x-www-form-urlencoded'}, body: datos})

        if(!respuesta.ok)
        {
            throw new Error("Error al agregar nuevo participante")
        }

        const htmlrespuesta = await respuesta.text();

        const contenedorUsuarios = document.getElementById('listaParticipantes')
        contenedorUsuarios.insertAdjacentHTML('beforeend', htmlrespuesta);
        actualizarInterfaz();
    }
    catch (error)
    {
        jUtils.show('iError', error.message);
    }
    finally {
        jUtils.hideLoading();
    }

});

function actualizarInterfaz()
{
    const inputs = document.querySelectorAll("input")
    if (inputs.length >=3)
    {
        jUtils.show("btnSortear")
    }
}

async function extraerBolita(){

    const participantes = document.querySelectorAll("#listaParticipantes input")
    for(let i = 0; i< participantes.length; i++)
    {
        if (participantes[i].value.trim() === '')
        {
            jUtils.show('iError', 'NO DEJES NOMBRES VACIOS');
            return;
        }
    }


    try
    {
        jUtils.hide("btnAgregar");
        jUtils.clean('iError');

        const participantesActivos = document.querySelectorAll('#listaParticipantes tr:not(.eliminado)');
        const cantidadParticipantesActivos = participantesActivos.length;

        if (cantidadParticipantesActivos < 2){
            jUtils.show('iError', 'Ya no quedan más participantes para sortear');
            jUtils.hide('btnSortear');
            jUtils.show('btnReiniciar');
            return;
        }

        jUtils.showLoading();

        const datos = new URLSearchParams({
            cantidad : cantidadParticipantesActivos
        })

        const respuesta = await fetch('./sortear.jsp',
            {method: 'POST',
                headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                body: datos})

        if(!respuesta.ok)
        {
            throw new Error("Error al agregar nuevo participante")
        }

        const indiceTexto = await respuesta.text();
        const indice = parseInt(indiceTexto.trim());

        const filaAEliminar = participantesActivos[indice];
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

function reiniciar()
{
    location.reload();
}