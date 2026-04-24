const boton = document.getElementById('activar'); // [cite: 594]
const miarray = [1, 2, 5, 4];

// 1. Ordenar (modifica el original) [cite: 196]
miarray.sort((a, b) => a - b);
console.log("Después de sort:", miarray); 

// 2. Agregar al principio (devuelve el nuevo length) [cite: 200]
miarray.unshift(22); 

// 3. Quitar el primero (devuelve el elemento sacado) [cite: 203]
const eliminado = miarray.shift(); 
console.log("Array final:", miarray); 

/**
 * GENERADOR DE NÚMEROS DINÁMICO
 */
const generarNumeros = (cantidad) => {
    const contenedor = document.getElementById('numeros'); // [cite: 594]
    
    // Limpiamos contenido previo usando innerHTML [cite: 516]
    contenedor.innerHTML = ""; 

    for (let i = 0; i < cantidad; i++) {
        // Math.floor para redondear y Math.random para el aleatorio [cite: 151, 153]
        const numeroAleatorio = Math.floor(Math.random() * 100) + 1;

        // 1. Crear el nodo del elemento [cite: 520]
        const nuevoElemento = document.createElement('div');
        
        // 2. Asignar texto [cite: 517]
        nuevoElemento.textContent = `Número: ${numeroAleatorio}`;
        
        // 3. Inyectar en el árbol del DOM [cite: 522]
        contenedor.appendChild(nuevoElemento);
    }
};

// Escuchador de eventos [cite: 525]
// Usamos la variable 'boton' que definimos arriba
boton.addEventListener("click", () => generarNumeros(5));

// Ejemplo: Mostrar un mensaje después de 3 segundos
const timerUnico = setTimeout(() => {
    console.log("Han pasado 3 segundos ");
    alert("¡Tiempo cumplido!");
}, 3000); // 3000ms = 3 segundos 

// Para cancelar este timer antes de que ocurra[cite: 167]:
// clearTimeout(timerUnico);

let segundos = 0;

// Ejemplo: Un contador que incrementa cada segundo
const timerRepetitivo = setInterval(() => {
    segundos++;
    console.log(`Segundos transcurridos: ${segundos} `);
    
    // Detener el intervalo si llega a 10 para evitar bucles infinitos
    if (segundos === 10) {
        clearInterval(timerRepetitivo); // Cancela el intervalo [cite: 168]
        console.log("Contador detenido [cite: 168]");
    }
}, 1000); // Se ejecuta cada 1000ms (1 segundo)