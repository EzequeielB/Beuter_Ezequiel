/*Ejercicio 3
a)Modificar el programa lector 3, reemplazar la anteúltima línea por:
console.log(JSON.stringify(data));
¿Qué sucede cuando utilizamos JSON.stringify?
b) Agregar debajo:
console.log(data);
¿Que sucede? Por que?
*/
'use strict';
const fs = require('fs');
fs.readFile('personas.json', (err, data) => {
    console.log(JSON.stringify(data));
    console.log(data);
});

//a) Al utilizar "JSON.stringify" recibimos nuevamente una serie de  numeros. Esto porque "readFile"  accede a un fichero para su lectura y nos entrega el contenido en forma de buffer o en forma de cadena y "JSON.stringify" nos devuelve una cadena de texto JSON.

//b) Al "agregar console.log(data)" vemos los datos almacenados en "data" que es el buffer generado por "readFile" a partir del fichero indicado.