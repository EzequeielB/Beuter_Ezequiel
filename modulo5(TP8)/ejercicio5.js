/*
Ejercicio 5
Crear un programa (ejercicio5.js) capaz de leer el archivo departamentos.json.
Luego recorrer e imprimir nombre + puesto de los empleados de tecnologia.
Al ejecutar node ejercicio5.js la salida en consola debería ser la siguiente:
Pablo Richmon PM
Marta Fernandez TechLead
Pedro Mendez FullStack js
*/

const fs = require('fs');
const rawdata = fs.readFileSync('./departamentos.json', 'utf8');
var persona = JSON.parse(rawdata);
for(var i=0;i<persona['departamentos'].length;i++){ if(i==1){
console.log(persona['departamentos'][i]['tecnología']);
}
}
