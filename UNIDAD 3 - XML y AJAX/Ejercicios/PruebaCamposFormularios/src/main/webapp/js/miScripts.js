function pasoRegistro(boton, indice){
    const tarjeta = boton.closest(".card");
    const inputs = tarjeta.querySelectorAll(".form-control");

    inputs.forEach((campo) =>{
        campo.disabled = false;
    })

    jUtils.hide("botonRegistro" + indice);
    jUtils.show("contenedorBotones" + indice);
}

async function guardar(event,formulario,indice){
    jUtils.clean('iError');

    try
    {
        jUtils.showLoading();

        const formDatos = new FormData(formulario);
        const datos = new URLSearchParams(formDatos);

        const respuesta = await fetch('procesamiento.jsp', {method:'POST', headers:{'Content-Type':'application/x-www-form-urlencoded'}, body: datos});

        if (!respuesta.ok){
            throw new Error("Error de procesado de datos");
        }
    }
    catch (error)
    {
        jUtils.show('iError', error.message);
    }
    finally
    {
        jUtils.hideLoading();
    }

    location.reload();
}