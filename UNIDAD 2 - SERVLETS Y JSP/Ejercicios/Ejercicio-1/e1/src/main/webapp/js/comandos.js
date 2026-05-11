const prioridades = document.getElementById("prioridad");
const radioSI = document.getElementById("si");
const radioNO = document.getElementById("no");
const campoEmail = document.getElementById("email");

const prioridadYnotif = () =>{

    const valorSelect = prioridades.value;

    if(valorSelect === "Alta"){
        radioSI.checked = true;
        radioNO.checked = false;

        radioSI.disabled = true;
        radioNO.disabled = true;
    }
    else {
        radioSI.disabled = false;
        radioNO.disabled = false;
    }
}

const desactivarEmail = () =>{

    if(radioNO.checked){
        campoEmail.disabled = true;
        campoEmail.value = "";
    }
    if(radioSI.checked){
        campoEmail.disabled = false;
    }
}

function gestionarEstado(link, index) {
    const fila = link.closest('tr');
    const esDescartar = link.innerText === 'Descartar';

    if (esDescartar) {
        // Solicitar confirmación [cite: 22]
        if (confirm("¿Está seguro de que desea descartar este evento?")) {
            fila.classList.add('fila-descartada'); // Aplicar rojo y tachado
            link.innerText = 'Recuperar'; // Cambiar link
            actualizarEstadoEnServidor(index, true);
        }
    } else {
        // Lógica de Recuperar [cite: 24]
        fila.classList.remove('fila-descartada');
        link.innerText = 'Descartar';
        actualizarEstadoEnServidor(index, false);
    }
}

prioridades.addEventListener("change", prioridadYnotif);
radioNO.addEventListener("change", desactivarEmail);
radioSI.addEventListener("change", desactivarEmail);