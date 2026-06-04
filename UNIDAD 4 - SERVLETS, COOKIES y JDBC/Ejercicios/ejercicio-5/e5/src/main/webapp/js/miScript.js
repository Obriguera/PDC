const Jarealineas = {

    busqueda : async (event) => {
        event.preventDefault();

        try{
            jUtils.showLoading();
            jUtils.clean('iError');

            const formDatos = new FormData(event.target());
            const datos = new URLSearchParams(formDatos);

            const respuesta = await fetch('validar.jsp',{
                headers: {"Content-Type": "application/x-www-form-urlencoded"},
                method: 'POST',
                body: datos
            });

            if (!respuesta.ok)
            {
                const text = await response.text();
                throw new Error(text || response.statusText);
            }

            jUtils.show('iResult', await respuesta.text());
            //document.getElementById("iReservaForm").addEventListener("submit", jAerolineas.enviar);
        }
        catch (error)
        {
            jUtils.show('iError', error.message);
            console.log(error)
        }
        finally {
            jUtils.hideLoading();
        }
    }


}
