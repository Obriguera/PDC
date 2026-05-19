function seleccionarUno(algo){
    if (algo.checked){
        var filas = document.getElementsByName(algo.name);

        for (var i = 0; i < filas.length; i++){
            if (filas[i] !== algo){
                filas[i].checked = false;
            }
        }
    }

}

document.getElementById("btnResultados").addEventListener('click', async(event) =>{
    event.preventDefault();
    jUtils.clean('iError');
    try {
        jUtils.showLoading();

        let marcados = document.querySelectorAll('.check-prode:checked');

        if (marcados.length < 10){
            <jUtils.show('iError', 'No se cargaron todos los resultados');>
            return;
        }

        const datos = new URLSearchParams();

        marcados.forEach(check =>{
            datos.append(check.name, check.value);
        });

        const response = await fetch('./calcular.jsp', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: datos
        });

        if(!response.ok){
            throw new Error("error de comunicación con el modulo de calculo");
        }

        const htmlResultados = await response.text();

        jUtils.show('iResultados', htmlResultados);
        jUtils.hide('btnResultados');
        jUtils.show('btnReinicio')
    }
    catch (error)
    {
        jUtils.show('iError', error.message);
    }
    finally
    {
        jUtils.hideLoading();
    }
});


document.getElementById('btnReinicio').addEventListener('click', () => {
   location.reload();
});