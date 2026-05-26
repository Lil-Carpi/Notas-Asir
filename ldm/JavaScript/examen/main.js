let boton = document.getElementById("boto_alerta");
boton.addEventListener("click", functioalerta);
function functioalerta() {
    alert("ALERTA");
}

let boton_color = document.getElementById("boton_color_test");
boton_color.addEventListener("click", funcionBotonColor);
let texto = document.getElementById("color");
function funcionBotonColor() {
    texto.style.color = "green"
}

let botonServidor = document.getElementById("encender_servidor");
let estadoServidor = document.getElementById("estat_servidor");
botonServidor.addEventListener("click", encenderServidor);
function encenderServidor() {
    estadoServidor.innerHTML = "El servidor esta encendido";
    estadoServidor.style.color = "green";
    botonServidor.innerHTML = "El servidor ha sido encendido";
}

// lo que se supone que es el examen:

let ex1botonColor = document.getElementById("boton_color");
let ex2hover = document.getElementById("caja");
let ex3texto = document.getElementById("textoInput");
let ex4bombilla = document.getElementById("bombilla_button");
let ex5esconder = document.getElementById("esconder");

//Ex1

botonValor = 1
ex1botonColor.addEventListener("click", cambiarColor);
function cambiarColor () {
    if (botonValor == 0) {
        ex1botonColor.innerHTML = "Cambiame de color!";
        ex1botonColor.style.background = "blueviolet";
        botonValor += 1;
    } else {
        ex1botonColor.innerHTML = "Color cambiado!";
        ex1botonColor.style.background = "red";
        botonValor = 0;
    }
}

// Ex2
let ex2hovercontent = document.getElementById("cajaContent");
ex2hover.addEventListener("mouseover", hoverfunction);
ex2hover.addEventListener("mouseleave", nohoverfunction);
function hoverfunction () {
    ex2hover.style.backgroundColor = "red";
    ex2hovercontent.innerHTML = "Estas dentro!";
}
function nohoverfunction () {
    ex2hover.style.backgroundColor = "blue";
    ex2hovercontent.innerHTML = "Estas fuera";
}

// Ex3
let ex3textoOutput = document.getElementById("textoOutput");
textoInput.addEventListener("input", textoInputFunction);
function textoInputFunction () {
    ex3textoOutput.innerHTML = textoInput.value
}

// Ex4
bombillaValue = 1;
bombillaIMG = document.getElementById("bombilla");
ex4bombilla.addEventListener("click", onOffFunction);
function onOffFunction () {
    if (bombillaValue == 0) {
        bombillaIMG.src = "assets/apagado.png"
        ex4bombilla.innerHTML = "ON";
        bombillaValue += 1;
    } else {
        bombillaIMG.src ="assets/encendido.png"
        ex4bombilla.innerHTML = "OFF";
        bombillaValue = 0;
    }
} 

// Ex5
fantasmaValue = 0;
let imgfantasma = document.getElementById("fantasma");
ex5esconder.addEventListener("click", esconderDescubrir);
function esconderDescubrir () {
    // aqui se pueden hacer de dos maneras:
    // o retirando el src de la imagen
    // o añadiendo css "display:none;"
    if (fantasmaValue == 0) {
        imgfantasma.style.display = "none";
        fantasmaValue += 1;
    } else {
        imgfantasma.style.display = "";
        fantasmaValue = 0;
    }
}
// gg ez bot lobby
