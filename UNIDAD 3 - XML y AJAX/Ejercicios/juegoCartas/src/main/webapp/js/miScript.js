document.getElementById('iForm').addEventListener('submit', async (event) =>{
    event.preventDefault();

    jUtils.clean('iError');
    jUtils.showLoading();


    try{

        const respuesta = await fetch('pedirCarta.jsp',{method: 'POST'});

        if (!respuesta.ok) {
            throw new Error("Error al pedir la carta en el servidor");
        }

        const cartaNueva = await respuesta.text();
        location.reload();
    }
    catch (error)
    {
        jUtils.show('iError', error.message);
    }
    finally {
        jUtils.hideLoading();
    }
})

async function plantarse(){
    try{
        jUtils.clean('iError');
        jUtils.showLoading();

        const respuesta = await fetch('plantarse.jsp',{method: 'POST'});

        if (!respuesta.ok) {
            throw new Error("Error al pedir la carta en el servidor");
        }

        location.reload();
    }
    catch (error)
    {
        jUtils.show('iError', error.message);
    }
    finally {
        jUtils.hideLoading();
    }
}

async function reiniciar(){
    try{
        jUtils.clean('iError');
        jUtils.showLoading();

        const respuesta = await fetch('reiniciar.jsp',{method: 'POST'});

        if (!respuesta.ok) {
            throw new Error("Error al pedir la carta en el servidor");
        }

        location.reload();
    }
    catch (error)
    {
        jUtils.show('iError', error.message);
    }
    finally {
        jUtils.hideLoading();
    }
}