"use strict";

const salida = document.getElementById("salida");
const btnEjecutar = document.getElementById("btnEjecutar");
const btnLimpiarSalida = document.getElementById("btnLimpiarSalida");

const formulario = document.getElementById("miFormulario");
const inputNombre = document.getElementById("nombre");
const inputEdad = document.getElementById("edad");

const btnAgregar = document.getElementById("btnAgregar");
const listaDinamica = document.getElementById("listaDinamica");

const btnGuardar = document.getElementById("btnGuardar");
const valorGuardado = document.getElementById("valorGuardado");

const btnCargarTabla = document.getElementById("btnCargarTabla");
const cuerpoTabla = document.getElementById("cuerpoTabla");

const btnPromesa = document.getElementById("btnPromesa");
const btnIniciarTimer = document.getElementById("btnIniciarTimer");
const btnDetenerTimer = document.getElementById("btnDetenerTimer");
const contadorSpan = document.getElementById("contador");

let contador = 0;
let intervalId = null;

const datosTabla = [
    { id: 1, nombre: "Lucia", rol: "Estudiante", estado: "Activo" },
    { id: 2, nombre: "Martin", rol: "Docente", estado: "Pendiente" },
    { id: 3, nombre: "Sofia", rol: "Analista", estado: "Activo" },
    { id: 4, nombre: "Nicolas", rol: "Invitado", estado: "Inactivo" },
];

function imprimir(linea) {
    salida.textContent += `${linea}\n`;
}

function separar(titulo) {
    imprimir(`\n===== ${titulo} =====`);
}

function ejecutarEjemplosGenerales() {
    salida.textContent = "";
    separar("1) Variables, tipos y operadores");

    const constante = "no cambia";
    let mutable = 10;
    mutable += 5;

    const numero = 42;
    const texto = "JavaScript";
    const booleano = true;
    const nulo = null;
    let indefinido;
    const bigint = 9007199254740993n;
    const simbolo = Symbol("id");

    imprimir(`const: ${constante} | let: ${mutable}`);
    imprimir(`tipos: ${typeof numero}, ${typeof texto}, ${typeof booleano}`);
    imprimir(`null: ${nulo}, undefined: ${indefinido}`);
    imprimir(`bigint: ${bigint} | symbol: ${String(simbolo)}`);

    const nombreIngresado = "";
    const nombreFinal = nombreIngresado || "Invitado (con OR)";
    const nombreConNulos = null ?? "Invitado (con ??)";
    const persona = { contacto: { email: "mail@demo.com" } };

    imprimir(`OR: ${nombreFinal}`);
    imprimir(`??: ${nombreConNulos}`);
    imprimir(`Optional chaining: ${persona?.contacto?.email}`);

    separar("2) Condicionales y bucles");

    const edad = 18;
    if (edad >= 18) {
        imprimir("if/else: es mayor de edad");
    } else {
        imprimir("if/else: es menor de edad");
    }

    const rol = "admin";
    switch (rol) {
        case "admin":
            imprimir("switch: acceso total");
            break;
        case "user":
            imprimir("switch: acceso parcial");
            break;
        default:
            imprimir("switch: acceso desconocido");
    }

    for (let i = 1; i <= 3; i += 1) {
        imprimir(`for: vuelta ${i}`);
    }

    let intento = 0;
    while (intento < 2) {
        imprimir(`while: intento ${intento + 1}`);
        intento += 1;
    }

    separar("3) Funciones");

    function sumar(a, b = 0) {
        return a + b;
    }

    const restar = function (a, b) {
        return a - b;
    };

    const multiplicar = (a, b) => a * b;

    const promedio = (...numeros) => {
        const total = numeros.reduce((acc, n) => acc + n, 0);
        return total / numeros.length;
    };

    imprimir(`sumar(3, 4): ${sumar(3, 4)}`);
    imprimir(`restar(10, 6): ${restar(10, 6)}`);
    imprimir(`multiplicar(5, 5): ${multiplicar(5, 5)}`);
    imprimir(`promedio(2, 4, 6): ${promedio(2, 4, 6)}`);

    separar("4) Arrays y metodos utiles");

    const numeros = [4, 10, 21, 8, 15];
    const pares = numeros.filter((n) => n % 2 === 0);
    const alCuadrado = numeros.map((n) => n ** 2);
    const sumaTotal = numeros.reduce((acc, n) => acc + n, 0);
    const primeroMayorA20 = numeros.find((n) => n > 20);
    const hayMayoresA30 = numeros.some((n) => n > 30);
    const todosPositivos = numeros.every((n) => n > 0);
    const ordenados = [...numeros].sort((a, b) => a - b);

    imprimir(`original: ${JSON.stringify(numeros)}`);
    imprimir(`filter (pares): ${JSON.stringify(pares)}`);
    imprimir(`map (cuadrado): ${JSON.stringify(alCuadrado)}`);
    imprimir(`reduce (suma): ${sumaTotal}`);
    imprimir(`find (>20): ${primeroMayorA20}`);
    imprimir(`some (>30): ${hayMayoresA30}`);
    imprimir(`every (>0): ${todosPositivos}`);
    imprimir(`sort asc: ${JSON.stringify(ordenados)}`);

    separar("5) Objetos, destructuring y copias");

    const usuario = {
        id: 1,
        nombre: "Octavio",
        direccion: { ciudad: "Cordoba", cp: 5000 },
    };

    const { nombre, direccion: { ciudad } } = usuario;
    const copiaSuperficial = { ...usuario };
    const copiaProfunda = structuredClone(usuario);
    copiaProfunda.direccion.ciudad = "Rosario";

    imprimir(`destructuring nombre: ${nombre}`);
    imprimir(`destructuring ciudad: ${ciudad}`);
    imprimir(`copia superficial ciudad: ${copiaSuperficial.direccion.ciudad}`);
    imprimir(`copia profunda ciudad modificada: ${copiaProfunda.direccion.ciudad}`);
    imprimir(`objeto original ciudad: ${usuario.direccion.ciudad}`);

    separar("6) Set, Map y JSON");

    const set = new Set(["html", "css", "js", "js"]);
    const map = new Map();
    map.set("tema", "asincronia");
    map.set("nivel", "examen");

    const json = JSON.stringify(usuario);
    const objetoRecuperado = JSON.parse(json);

    imprimir(`Set sin duplicados: ${JSON.stringify([...set])}`);
    imprimir(`Map tema: ${map.get("tema")}`);
    imprimir(`JSON string: ${json}`);
    imprimir(`JSON parse nombre: ${objetoRecuperado.nombre}`);

    separar("7) Clases y herencia");

    class Persona {
        constructor(nombrePersona) {
            this.nombrePersona = nombrePersona;
        }

        saludar() {
            return `Hola, soy ${this.nombrePersona}`;
        }
    }

    class Estudiante extends Persona {
        constructor(nombrePersona, materia) {
            super(nombrePersona);
            this.materia = materia;
        }

        saludar() {
            return `${super.saludar()} y estudio ${this.materia}`;
        }
    }

    const estudiante = new Estudiante("Lucia", "JavaScript");
    imprimir(estudiante.saludar());

    separar("8) Manejo de errores (try/catch/finally)");

    try {
        const valor = Number("texto");
        if (Number.isNaN(valor)) {
            throw new Error("No se pudo convertir a numero");
        }
    } catch (error) {
        imprimir(`catch: ${error.message}`);
    } finally {
        imprimir("finally: bloque ejecutado siempre");
    }

    separar("9) Fechas y Math");

    const ahora = new Date();
    const random = Math.floor(Math.random() * 100) + 1;
    imprimir(`fecha ISO: ${ahora.toISOString()}`);
    imprimir(`numero aleatorio 1-100: ${random}`);

    console.log("Ejemplos ejecutados");
}

function recuperarStorage() {
    const guardado = localStorage.getItem("preferenciaUsuario");
    valorGuardado.textContent = guardado || "---";
}

function cargarTabla() {
    cuerpoTabla.innerHTML = "";

    datosTabla.forEach((fila) => {
        const tr = document.createElement("tr");
        tr.innerHTML = `
            <td>${fila.id}</td>
            <td>${fila.nombre}</td>
            <td>${fila.rol}</td>
            <td>${fila.estado}</td>
        `;
        cuerpoTabla.appendChild(tr);
    });
}

function simularPromesa() {
    return new Promise((resolve) => {
        setTimeout(() => {
            resolve("Promesa resuelta: datos recibidos");
        }, 2000);
    });
}

btnEjecutar.addEventListener("click", ejecutarEjemplosGenerales);

btnLimpiarSalida.addEventListener("click", () => {
    salida.textContent = "";
});

formulario.addEventListener("submit", (evento) => {
    evento.preventDefault();

    if (!formulario.checkValidity()) {
        imprimir("Formulario invalido: revisa nombre (min 3) y edad (max 99)");
        return;
    }

    const datos = {
        nombre: inputNombre.value.trim(),
        edad: Number(inputEdad.value),
    };

    imprimir(`Formulario OK -> ${JSON.stringify(datos)}`);
    formulario.reset();
});

btnAgregar.addEventListener("click", () => {
    const nuevoElemento = document.createElement("li");
    nuevoElemento.innerHTML = `Item ${listaDinamica.children.length} <button class="btnEliminar" type="button">Eliminar</button>`;
    listaDinamica.appendChild(nuevoElemento);
});

listaDinamica.addEventListener("click", (evento) => {
    if (evento.target.classList.contains("btnEliminar")) {
        evento.target.parentElement.remove();
    }
});

btnGuardar.addEventListener("click", () => {
    const valor = `Guardado ${new Date().toLocaleTimeString()}`;
    localStorage.setItem("preferenciaUsuario", valor);
    recuperarStorage();
    imprimir("Dato guardado en localStorage");
});

btnCargarTabla.addEventListener("click", () => {
    cargarTabla();
    imprimir("Tabla cargada con datos de ejemplo");
});

btnPromesa.addEventListener("click", async () => {
    imprimir("Iniciando promesa...");
    const resultado = await simularPromesa();
    imprimir(resultado);
});

btnIniciarTimer.addEventListener("click", () => {
    if (intervalId !== null) {
        return;
    }

    intervalId = setInterval(() => {
        contador += 1;
        contadorSpan.textContent = String(contador);
    }, 1000);
});

btnDetenerTimer.addEventListener("click", () => {
    if (intervalId === null) {
        return;
    }

    clearInterval(intervalId);
    intervalId = null;
});

// Captura de eventos: se ejecuta antes de la fase de burbuja.
document.body.addEventListener(
    "click",
    () => {
        console.log("Captura activa en body");
    },
    true
);

recuperarStorage();
