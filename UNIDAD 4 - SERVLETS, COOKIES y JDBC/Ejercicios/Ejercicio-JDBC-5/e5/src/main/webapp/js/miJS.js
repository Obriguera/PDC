document.getElementById('iForm').addEventListener('submit', async (event) =>{
    try{
        jUtils.clean("iError");
        jUtils.showLoading()

        const formData = new FormData(document.getElementById('iForm'));
        const datos = new URLSearchParams(formData);

        const respuesta = await fetch('validar',{
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            method: 'POST',
            body: datos
        })

        if (!respuesta.ok){
            const text = await respuesta.text();
            throw new Error(text || respuesta.statusText);
        }

        jUtils.show('iResult', await respuesta.text());
        document.getElementById("iReservaForm").addEventListener("submit", enviar);
    }
    catch (e) {
        jUtils.show("iError", e.message);
        console.log(e);
    }
    finally {
        jUtils.hideLoading();
    }
})

////

async function enviar(event)
{
    try{
        event.preventDefault();
        jUtils.clean("iError");
        jUtils.showLoading()

        const formData = new FormData(event.target);
        const datos = new URLSearchParams(formData);

        const respuesta = await fetch('enviar',{
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            method: 'POST',
            body: datos
        })

        if (!respuesta.ok){
            const text = await respuesta.text();
            throw new Error(text || respuesta.statusText);
        }

        document.querySelector("body").innerHTML = await respuesta.text();
    }
    catch (e) {
        jUtils.show("iError", e.message);
        console.log(e);
    }
    finally {
        jUtils.hideLoading();
    }
}