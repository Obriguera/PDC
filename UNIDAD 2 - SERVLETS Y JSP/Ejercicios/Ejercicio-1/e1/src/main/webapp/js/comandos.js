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
        
    }
}

prioridades.addEventListener("change", prioridadYnotif);