function seleccionarUno(checkboxTocador){
    if (checkboxTocador.checked){
        var fila = document.getElementsByName(checkboxTocador.name);

        for (var i = 0; i < fila.length; i++) {
            if (fila[i] !== checkboxTocador) {
                fila[i].checked = false;
            }
        }
    }
}

function validarProde() {
    var marcados = document.querySelectorAll('.check-prode:checked');

    // Como son 10 partidos, tiene que haber 10 marcados [cite: 46-56]
    if (marcados.length < 10) {
        alert("Error: Debes indicar un resultado para todos los partidos.");
    } else {
        // Si estatodo bien, enviamos el formulario manualmente
        document.getElementById('formProde').submit();

        const btnResultados = document.getElementById('btn-resultados');
        btnResultados.disabled = true;
        btnResultados.innerText = "Procesando...";
    }
    console.log("sumbit");
    console.log(this.value());
}

// 3. Función para el botón "Volver a jugar" (Reinicio)
function reiniciarJuego() {
    console.log("reinicio");
    var todos = document.querySelectorAll('.check-prode');
    for (var i = 0; i < todos.length; i++) {
        todos[i].checked = false;
    }
    window.location.href = "./limpiarResultados.jsp"
}