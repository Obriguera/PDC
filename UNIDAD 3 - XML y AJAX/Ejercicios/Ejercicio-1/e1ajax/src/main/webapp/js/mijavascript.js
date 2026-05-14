document.getElementById('iformParticipantes').addEventListener('submit', async (event) => {
    event.preventDefault();


    try
    {
        jUtils.clean("iError");
        jUtils.showLoading();

        const respuesta = await fetch('./getRow.jsp',{ method: 'POST' });

        if(!respuesta.ok){
            throw new Error("No se pudo realizar la operacion");
        }

        const htmlFila = await respuesta.text();

        // Buscamos el cuerpo de la tabla por su ID [cite: 36]
        const lista = document.getElementById('iList');

        // Lo pegamos al final, justo antes de que termine el tbody
        lista.insertAdjacentHTML('beforeend', htmlFila);
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

const actualizarInterfaz = () => {
    const filas = document.querySelectorAll('#iList tr');
    if( filas.length >= 3){
        jUtils.show("btnSortear");
    }else {
        jUtils.hide("btnSortear");
    }
}


document.getElementById('btnSortear').addEventListener('click',async() =>{

    try{
        jUtils.clean("iError");

        const inputs = document.querySelectorAll('#iList input');
        for (let i=0; i < inputs.length; i++){
            if(inputs[i].value.trim() === ""){
                jUtils.show('iError', "No dejes nombres vacios");
                return;
            }
        }

        document.getElementById('btnAgregar').disabled = true; //
        inputs.forEach(input => input.readOnly = true); //


        const participantesActivos = document.querySelectorAll('#iList tr:not(.eliminado)');
        const cantidadActivos = participantesActivos.length;

        if (cantidadActivos < 3){
            jUtils.show('iError', 'Ya no quedan más personas para sortear, solo quedan 2');
            jUtils.hide('btnSortear');
            jUtils.show('btnIniciar');
            return;
        }

        jUtils.showLoading();

        const datos = new URLSearchParams({
            cantidad : cantidadActivos
        })

        //Ajax del sorteo
        const respuesta = await fetch('./sorteo.jsp',
            {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: datos
            });

        if(!respuesta.ok){
            throw new Error("Error en el servidor")
        }


        const indiceTexto = await respuesta.text();
        const indice = parseInt(indiceTexto.trim());

        const filaAEliminar = participantesActivos[indice];
        filaAEliminar.classList.add('eliminado');

        filaAEliminar.style.color = "#F00"; // Rojo [cite: 19]
        filaAEliminar.style.textDecoration = "line-through"; // Tachado [cite: 19]

    }catch (error){
        jUtils.show('iError', error.message);
    }finally {
        jUtils.hideLoading();
    }
});


document.getElementById('btnIniciar').addEventListener('click', () =>{

    location.reload();

});