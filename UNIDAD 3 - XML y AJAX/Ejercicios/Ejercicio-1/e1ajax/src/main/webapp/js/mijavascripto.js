const actualizarInterfaz = () =>{
    const filas = document.querySelectorAll('#iList tr'); //busca todas las tr que estén dentro del elementi iList

    if(filas.length >=3){
        jUtils.show('btnSortear');
    }else{
        jUtils.hide('btnSortear')
    }
}


// Evento para agregar participantes mediante AJAX
document.getElementById("iformParticipantes").addEventListener('submit', async (event) =>{
    event.preventDefault();

    try{
        jUtils.clean('ierror');
        jUtils.showLoading();

        // Invocación con AJAX para agregar una fila [cite: 18]
        const response = await fetch('./getRow.jsp', { method: 'POST' });

        if(!response.ok){
            throw new Error("Error al obtener la fila")
        }

        const htmlFila = await response.text();
        const lista = document.getElementById('iList');
        lista.insertAdjacentHTML('beforeend', htmlFila);
        actualizarInterfaz();

    }
    catch (a){
        jUtils.show('ierror', error.message);
    }
    finally{
        jUtils.hideLoading();
    }
})