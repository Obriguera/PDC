const resultado = document.getElementById('display-codigo');
const boton = document.getElementById('boton');

const generarSorteo = (total_sorteos = 8) => {
  const numeros = [];
  let cantidad = 0;

  const intervalo = setInterval(() => {
    const numero = Math.floor(Math.random() * 10);
    numeros.push(numero);
    resultado.textContent = numeros.join(" ");
    cantidad++;

    if (cantidad >= total_sorteos) {
      clearInterval(intervalo);
    }
  }, 300); // 300
};

boton.addEventListener("click", () => generarSorteo(8));