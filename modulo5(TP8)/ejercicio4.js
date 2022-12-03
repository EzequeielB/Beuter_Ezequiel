/*
Ejercicio 4
Partiendo del programa “Obtener nombres”, crear una función llamada getNombre que reciba el
arreglo de las personas y busque todas las personas de la localidad Posadas. Si encuentra debe imprimir el nombre y el apellido de la persona.
Llamar a la función getNombre(persona);
Guardar el programa en ejercicio4.js
Al ejecutar node ejercicio4.js la salida en consola debería ser la siguiente:
Maria Nieves
Ramon Rodriguez
*/


const fs = require('fs');
const rawdata = fs.readFileSync('./personas.json', 'utf8');
var persona = JSON.parse(rawdata);

getNombre (persona,'personas')


function getNombre (array,json){
    for(var i=0;i<array[json].length;i++){
        if((array[json][i]['localidad'])=='Posadas'){
            console.log(array[json][i]['nombre']) + console.log(array[json][i]['apellido']);
        }
        }
}

