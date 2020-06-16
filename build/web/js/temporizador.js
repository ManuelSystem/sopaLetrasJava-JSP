/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var cronometro;
var s = document.getElementById("seconds");
var m = document.getElementById("minutes");
function main() {
    
    document.getElementById('detener').style.display = 'none';
}
function detenerTime() {
    clearInterval(cronometro);
    var b = m;
    var operacion = 80 - b.value;
    document.getElementById("score").value = operacion;
    
    document.getElementById('iniciar').style.display = 'none';
    document.getElementById('detener').style.display = 'none';
}

function inicioTime() {
    document.getElementById('detener').style.display = 'block';
    document.getElementById('iniciar').style.display = 'none';
    seconds = 0;
    
    

    cronometro = setInterval(function () {
        seconds++;
        secs = seconds;
        mins = 0;

        //se separa los segundos de los minuto; ejemplo 130 segundos = 2 minutos y 10 segundos
        while (secs >= 60) {
            mins++;
            secs -= 60;
        }
        if (mins < 10) {
            m.value = "0" + mins;
        } else {
            m.value = mins;
        }
        if (secs < 10) {
            s.value = "0" + secs;
        } else {
            s.value = secs;
        }
    }, 1000);

    console.log("Valor de cronometro" + cronometro);
}

function ocultar() {

}