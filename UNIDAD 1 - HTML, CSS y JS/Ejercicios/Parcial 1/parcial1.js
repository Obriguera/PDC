const cantidadInput = document.getElementById("cantidadGlobos");
const altoBase = document.getElementById('altoGlobos');
const anchoBase = document.getElementById('anchoGlobos');
const boton = document.getElementById("generador");
const contenedorGlobos = document.getElementById('misGlobos');

const colores = ['blue', 'red', 'green', 'yellow'];

const explotarGlobo = (globo) => {
    globo.classList.add('pop');
    globo.textContent = 'pop';
    globo.style.backgroundColor = 'transparent';
    globo.style.border = '2px dashed #666';
    globo.style.pointerEvents = 'none';

    setTimeout(() => {
        globo.remove();
    }, 2000);
};

const cambiarColorGlobo = (globo) => {
    const indiceActual = Number(globo.dataset.colorIndex || 0);

    if (indiceActual >= colores.length - 1) {
        explotarGlobo(globo);
        return;
    }

    const siguienteIndice = indiceActual + 1;
    globo.dataset.colorIndex = String(siguienteIndice);
    globo.style.backgroundColor = colores[siguienteIndice];
};


const generarGlobos = () =>{
    const cantidad = parseInt(cantidadInput.value, 10);
    const alto = parseInt(altoBase.value, 10);
    const ancho = parseInt(anchoBase.value, 10);

    contenedorGlobos.replaceChildren();

    for (let i = 0; i < cantidad; i++) {
        const nuevoGlobo = document.createElement('div');
        nuevoGlobo.classList.add('globo');
        nuevoGlobo.style.height = `${alto}px`;
        nuevoGlobo.style.width = `${ancho}px`;


        nuevoGlobo.style.backgroundColor = colores[0];
        nuevoGlobo.dataset.colorIndex = '0';


        nuevoGlobo.addEventListener('click', () => cambiarColorGlobo(nuevoGlobo));
        contenedorGlobos.appendChild(nuevoGlobo);
    }

}   



boton.addEventListener("click", generarGlobos);