/*
Ejercicio 1
a)Modificar el programa lector 1, reemplazar las 2 últimas líneas por:
console.log(JSON.stringify(rawdata));
¿Qué sucede cuando utilizamos JSON.stringify? Por que?
¿Qué sucede cuando utilizamos JSON.parse? Por que?
*/

const fs = require('fs');
let rawdata = fs.readFileSync('./personas.json');
console.log(JSON.stringify(rawdata));

//a)Cuando utilizamos "JSON.stringify" podemos observar en la consola una serie de números que representan el contenido del archivo json. Se representa asi porque "JSON.stringify" convierte un objeto o valor de JavaScript en una cadena de texto JSON.

//b)Cuando utilizamos "JSON.parse" vemos en la consola el contenido del archivo JSON en texto. Porque "JSON.parse" analiza el contenido de una cadena con formato JSON y extrae los valores que puede almacenar en un campo o variable.
