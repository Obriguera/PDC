function asignar(boton, indice){
    const tarjeta = boton.closest(".card");
    const ingresos = tarjeta.querySelectorAll(".ingreso-data");
    const primerInput = tarjeta.querySelector("input[name='apellido']");

    ingresos.forEach((ingreso) =>{
        ingreso.disabled = false;
    });

    jUtils.show("contenedorBotonesEdicion" + indice);
    jUtils.hide("btnAsignar" + indice);
    if (primerInput) {
        primerInput.focus();
    }
}

function cancelar(boton, indice){
    const tarjeta = boton.closest(".card");
    const ingresos = tarjeta.querySelectorAll(".ingreso-data");

    ingresos.forEach((ingreso) =>{
        ingreso.disabled = true;
        ingreso.value = "";
    });

    jUtils.show("btnAsignar" + indice);
    jUtils.hide("contenedorBotonesEdicion" + indice);
}

async function guardar(event, formulario, indice){
    event.preventDefault();
    jUtils.clean("iError");
    jUtils.showLoading();

    const tarjeta = boton.closest(".card");
    const ingresos = tarjeta.querySelectorAll(".ingreso-data");



    ingresos.forEach((ingreso) =>{
        if(ingreso.value.trim() === ""){
            jUtils.show('iError', 'No se cargaron todos los resultados');
            return;
        }
    });


    try
    {
        const formdatos = new FormData(formulario);
        const datos = new URLSearchParams(formdatos);

        const respuesta = await fetch('procesamiento.jsp', {method: 'POST', headers:{'Content-Type':'application/x-www-form-urlencoded'}, body: datos});

        if(!respuesta.ok){
            throw new Error("Algo ha salido mal");
        }

        location.reload();
    }

    catch (error)
    {
        jUtils.show('iError', error.message);
    }
    finally
    {
        jUtils.hideLoading();
    }



}
