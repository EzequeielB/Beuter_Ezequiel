/*
Ejercicio 2
a)Modificar el programa lector 2, reemplazar la última línea por:
console.log(JSON.stringify(jsonData));
¿Qué sucede cuando utilizamos JSON.stringify? Por que?
b)Agregar al final:
console.log(JSON.parse(jsonData));
¿Qué sucede cuando utilizamos JSON.parse? Por que?
*/

'use strict';
let jsonData = require('./personas.json');
console.log(JSON.stringify(jsonData));
console.log(JSON.parse(jsonData));

//a) Cuando utilizamos "JSON.stringify" en la consola nos devuelve el contenido del "personas.json" en una linea de texto. Esto sucede porque "require" importa los símbolos de "personas.json" y "JSON.stringify" convierte el objeto o valor de JavaScript en una cadena de texto JSON.

//b) Cuando utilizamos "JSON.parse" en la consola nos encotramos con un error "SyntaxError: Unexpected token o in JSON at position 1". Si buscamos por el motivo de este tipo de error encontramos que es por tratar de hacer "JSON.parse" a un valor que no valido de "JSON string".